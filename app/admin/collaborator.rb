ActiveAdmin.register Collaborator do

  controller do
    def permitted_params
      params.permit(:collaborator => [:name_en, :name_kr, :bio_en, :bio_kr, :avatar, :background_image])
    end
  end

  form do |f|
    f.inputs
    f.inputs "Collaborator" do
    f.input :avatar, :required => false, :as => :file
    f.input :background_image, :required => false, :as => :file  
  end
  f.actions
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
