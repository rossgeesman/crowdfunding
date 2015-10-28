ActiveAdmin.register Order do

 
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
member_action :charge_order, method: 'get' do
  begin

  order = Order.find(params[:id])
  @customer = Stripe::Customer.retrieve(:id => order.customer.stripe_customer_token)
  @amount = order.product.price
  charge = Stripe::Charge.create(
     :amount => @amount.to_i,
     :currency => "krw",
     :customer => @customer.id,
     :description => "Charge for Freshist"
    )
  rescue Stripe::CardError => e 
    redirect_to resource_path(order), {:notice => "Charge failed #{e.message}"}

  rescue => e 
    redirect_to resource_path(order), {:notice => "Charge failed #{e.message}"}

  else
    order.paid = true
    order.save!
    redirect_to resource_path(order), {:notice => 'Charge was succesful!'}
  end
end




action_item only: :show do
  link_to 'Charge', charge_order_admin_order_path(order) 
end
  
end

