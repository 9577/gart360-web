class AddIsFeaturedToArtworks < ActiveRecord::Migration
  def change
    add_column :artworks, :is_featured, :boolean, default: false

    add_index :artworks, :is_featured
  end
end
