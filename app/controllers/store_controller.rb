class StoreController < ApplicationController 
	skip_before_action :authorize_cust

	def index
    	@products = Product.order(:end_date)
	end

	def show
		@product = Product.find(params[:product_id])
	end
end

