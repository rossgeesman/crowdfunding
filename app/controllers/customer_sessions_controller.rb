class CustomerSessionsController < ApplicationController
	skip_before_action :authorize_cust
	
  
  def new
  end

  def create
  	customer = Customer.find_by(email: params[:email])
  	if customer and customer.authenticate(params[:password])
  		session[:customer_id] = customer.id
  		redirect_to current_customer
  	else
  		redirect_to customer_login_url, alert: t('customer_sessions.create.invalid')
  	end
  end

  def destroy
  	session[:customer_id] = nil
  	redirect_to store_url, notice: t('customer_sessions.destroy.logout')
  end
end
