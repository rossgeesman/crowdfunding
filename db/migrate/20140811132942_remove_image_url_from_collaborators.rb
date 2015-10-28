class RemoveImageUrlFromCollaborators < ActiveRecord::Migration
  def change
  	remove_column :collaborators, :image_url
  end
end
