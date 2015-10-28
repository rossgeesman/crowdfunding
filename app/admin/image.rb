ActiveAdmin.register Image do

  controller do
    def permitted_params
      params.permit(:image => [:product_photo, :product_id])
    end
  end

  form do |f|
    f.inputs "Image" do
    f.input :product_id, :as => :select,      :collection => Product.all
    f.input :product_photo, :required => false, :as => :file
  end
    f.actions
  end

  #index do
  #selectable_column

  #column "File" do |image|
  #  image.product_image.url(:medium)
  #end
  #column "Preview" do |image|
  #  image_tag(image.product_image.url(:medium))
  #end
  #column "Product Name" do |image|
  #  image.product.title
  #end
  #actions
  #end


  
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
  
end
