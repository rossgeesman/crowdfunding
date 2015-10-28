class AddExplainerToProducts < ActiveRecord::Migration
  def self.up
    add_attachment :products, :explainer
  end

  def self.down 
  	remove_attachment :products, :explainer
  end
end
