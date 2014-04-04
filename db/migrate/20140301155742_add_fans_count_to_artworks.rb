class AddFansCountToArtworks < ActiveRecord::Migration
  def change
    add_column :artworks, :fans_count, :integer, default: 0

    add_index :artworks, :fans_count
  end
end
