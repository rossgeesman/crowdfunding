class Image < ActiveRecord::Base
  belongs_to :product
  has_attached_file :product_photo, styles: {
    thumb: '159x105>',
    medium: '475x317>',
    large: '1188x792>'
  }


  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :product_photo, :content_type => /\Aimage\/.*\Z/
  scope :main_image, -> { where(main: true) }

  process_in_background :product_photo

end