class ApplicationController < ActionController::Base
	#before_action :authorize
	#before_action :authorize_cust
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_locale

protected

  def current_ability
    @current_ability ||= Ability.new(current_customer)
  end

  def authorize_cust
	if current_customer != Customer.find(params[:id])
		redirect_to customer_login_url, notice: "Please log in"
	end
  end

  def current_customer
    @current_customer = Customer.find_by(id: session[:customer_id])
  end
  
  helper_method :current_customer

  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
  end

  def default_url_options(options = {})
  	{locale: I18n.locale}
  end
end
