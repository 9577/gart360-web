class RemoveArtistCompleteFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :artist_complete
  end
end
