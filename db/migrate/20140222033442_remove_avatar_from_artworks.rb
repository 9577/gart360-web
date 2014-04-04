class RemoveAvatarFromArtworks < ActiveRecord::Migration
  def change
    remove_column :artworks, :avatar
  end
end
