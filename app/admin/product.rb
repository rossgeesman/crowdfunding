ActiveAdmin.register Product do


  controller do
    def permitted_params
      params.permit(:product => [:title_en, :title_kr, :explainer, :description_en, :description_kr, :price, :minbuy, :collaborator_id, :end_date, trait_ids: [], images_attributes: [:product_photo, :product_id, :_destroy, :id, :main]])
    end
  end

  form do |f|
    f.inputs # Include the default inputs
    f.inputs "Traits" do # Make a panel that holds inputs for traits
      f.input :traits, :as => :check_boxes, :collection => Hash[Trait.all.map{|t| [t.trait_name,t.id]}]  # Use formtastic to output my collection of checkboxes
    f.input :explainer, :required => false, :as => :file
    end
    f.has_many :images do |ff|
      ff.input :product_photo, as: :file
      ff.input :main, as: :boolean
      ff.input :_destroy, as: :boolean, :required => false

    end
    f.actions # Include the default actions
  end 

  action_item only: :show do
    link_to 'View on site', product_path(product)
  end

  
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
