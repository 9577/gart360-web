class AddArtistIdToAwards < ActiveRecord::Migration
  def change
    add_column :awards, :artist_id, :integer
    add_index :awards, :artist_id
  end
end
