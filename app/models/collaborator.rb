class Collaborator < ActiveRecord::Base
	translates :name, :bio
	has_many :products
	accepts_nested_attributes_for :products

	has_attached_file :avatar, styles: {
    standard: '150x150>',
    medium: '64x64>'
  }
    has_attached_file :background_image, styles: {
    	standard: '1731x716>'

    }

   # Validate the attached image is image/jpg, image/png, etc
   validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
   validates_attachment_content_type :background_image, :content_type => /\Aimage\/.*\Z/

   process_in_background :background_image
   process_in_background :avatar
end
