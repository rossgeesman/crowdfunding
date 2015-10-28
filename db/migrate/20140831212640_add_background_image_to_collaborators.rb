class AddBackgroundImageToCollaborators < ActiveRecord::Migration
  def self.up
    add_attachment :collaborators, :background_image
  end

  def self.down 
  	remove_attachment :collaborators, :background_image
  end
end
