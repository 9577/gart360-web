class DropGalleryTags < ActiveRecord::Migration
  def change
    drop_table :gallery_tags
  end
end
