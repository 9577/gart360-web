class AddPhotosCountToCollectionItems < ActiveRecord::Migration
  def change
    add_column :collection_items, :photos_count, :integer, default: 0
  end
end
