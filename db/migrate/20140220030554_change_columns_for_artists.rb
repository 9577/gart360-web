class ChangeColumnsForArtists < ActiveRecord::Migration
  def change

    rename_column :artists, :content, :bio
    remove_column :artists, :gallery_num
    remove_column :artists, :artwork_num

    add_column :artists, :educations_count, :integer, default: 0
    add_column :artists, :awards_count, :integer, default: 0
    add_column :artists, :exhibitions_count, :integer, default: 0

  end
end