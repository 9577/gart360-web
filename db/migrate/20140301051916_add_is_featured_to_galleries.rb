class AddIsFeaturedToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :is_featured, :boolean, default: false

    add_index :galleries, :is_featured
  end
end
