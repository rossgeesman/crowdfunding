class Order < ActiveRecord::Base
	belongs_to :product
	has_one :trait
	belongs_to :customer
	validates :customer, presence: true
	validates :recipient, :address_field_1, :address_field_2, :trait_name, :postal_code, :phone_number, presence: true
	before_save :clean
	after_create :send_confirmation_email

  private 

  def clean
  	self.phone_number = self.phone_number.gsub(/[^0-9]/, "")
  	self.postal_code = self.postal_code.gsub(/[^0-9]/, "")
  end

  def send_confirmation_email
    CustomerMailer.delay.order_confirmation(self)
  end

end