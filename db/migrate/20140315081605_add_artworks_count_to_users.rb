class AddArtworksCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :artworks_count, :integer, default: 0
  end
end
