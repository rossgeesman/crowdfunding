class PasswordResetsController < ApplicationController

  def new
  end

  def create
  	customer = Customer.find_by_email(params[:email])
  	customer.send_password_reset if customer
  	redirect_to store_url, :notice => "Email sent with password reset instructions."
  end

  def edit
  	@customer = Customer.find_by_password_reset_token!(params[:id])
  end

  def update
  	@customer = Customer.find_by_password_reset_token!(params[:id])
  	if @customer.password_reset_sent_at < 2.hours.ago
  		redirect_to new_password_reset_path :alert => "Password reset has expired."
  	elsif @customer.update(customer_params)
  		redirect_to store_url, :notice => "Your password has been reset!"
  	else
  		render :edit
  	end
  end

  private

  def customer_params
    params.require(:customer).permit(:password, :password_confirmation)
  end
end
