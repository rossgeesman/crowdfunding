class AddAvatarToCollaborators < ActiveRecord::Migration
  def self.up
    add_attachment :collaborators, :avatar
  end

  def self.down
    remove_attachment :collaborators, :avatar
  end
end
