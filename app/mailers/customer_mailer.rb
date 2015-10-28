class CustomerMailer < ActionMailer::Base
  default from: "contact@freshi.st"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.customer_mailer.password_reset.subject
  #
  def password_reset(customer)
    @customer = customer
    mail to: customer.email, :subject => "Password Reset"
  end

  def order_confirmation(order)
    @order = order
    mail to: order.customer.email, from: "ross@freshi.st", :subject => "Welcome to Freshist"
  end
end
