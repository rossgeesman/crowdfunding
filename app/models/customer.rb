class Customer < ActiveRecord::Base
	validates :email, presence: true, uniqueness: true
    has_secure_password
    has_many :orders, :inverse_of => :customer
    has_many :products, through: :orders
    accepts_nested_attributes_for :orders
    validates :terms_of_service, acceptance: true
    validates :privacy_policy, acceptance: true
    attr_accessor :stripe_card_token

    def send_password_reset
      generate_token(:password_reset_token)
      self.password_reset_sent_at = Time.zone.now
      save!
      CustomerMailer.password_reset(self).deliver
    end

    def generate_token(column)
     begin
     self[column] = SecureRandom.urlsafe_base64
     end while Customer.exists?(column => self[column])
    end
  

    def save_with_payment
      if valid?
        customer = Stripe::Customer.create(card: stripe_card_token)
        self.stripe_customer_token = customer.id
        save!
      end
    end

    def update_card(customer, card_info)

    token = Stripe::Token.create(
      card: {
        number: card_info[:number],
        exp_month: card_info[:exp_month],
        exp_year: card_info[:exp_year],
        cvc: card_info[:cvc]
      }
      )
    customer = Stripe::Customer.retrieve(customer.stripe_customer_token)
    card = customer.cards.create(card: token.id)
    card.save
    customer.default_card = card.id
    customer.save
    rescue Stripe::CardError => e
      logger.error "Stripe error while updating card info: #{e.message}"
      errors.add :base, e.code
      false
    rescue => e
      logger.error "An error occured while updating card info: #{e.message}"
      errors.add :base, "#{e.message}"
      false
    end
end