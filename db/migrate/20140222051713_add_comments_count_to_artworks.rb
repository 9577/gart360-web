class AddCommentsCountToArtworks < ActiveRecord::Migration
  def change
    add_column :artworks, :comments_count, :integer, default: 0

    add_index :artworks, :comments_count
  end
end
