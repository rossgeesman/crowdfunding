class AddProductPhotoToImages < ActiveRecord::Migration
  def self.up
    add_attachment :images, :product_photo
  end

  def self.down
    remove_attachment :images, :product_photo
  end
end
