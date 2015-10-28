class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    @order = @customer.orders.all
    @stripe_customer = Stripe::Customer.retrieve(@customer.stripe_customer_token)
    @default_card = @stripe_customer.sources.retrieve(@stripe_customer.default_source)
  end

  # GET /customers/new
  def new
    if Customer.find_by(id: session[:customer_id])
      redirect_to new_order_path(request.parameters)
    else
    @customer = Customer.new
    @product = Product.find(params[:product_id])
    @customer.orders.build
  end
end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save_with_payment
        session[:customer_id] = @customer.id
        format.html { redirect_to @customer, notice: t('customer.create.success') }
        format.json { render action: 'show', status: :created, location: @customer }
      else  
        format.html { redirect_to :back, notice: "#{@customer.errors.full_messages.join(' ')}" }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update

    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: t('customer.update.success') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1라
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url }
      format.json { head :no_content }
    end
  end

  def edit_card
    @customer = current_customer
  end

  def update_card
    @customer = current_customer
    card_info = {
    number:    params[:number],
    exp_month: params[:date][:month],
    exp_year:  params[:date][:year],
    cvc:       params[:cvc]
    }
    if @customer.update_card(@customer, card_info)
      flash[:notice] = t('customer.card.update.success')
      redirect_to @customer
    else
      flash[:notice] = t( 'customer.card.update.' + @customer.errors.full_messages.first) 
      redirect_to @customer
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:email, :password, :privacy_policy, :terms_of_service, :password_confirmation, :stripe_card_token, orders_attributes: [:product_id, :customer_id, :trait_name, :recipient, :address_field_1, :address_field_2, :postal_code, :phone_number])
    end
end
