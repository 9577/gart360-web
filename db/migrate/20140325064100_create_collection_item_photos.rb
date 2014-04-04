class CreateCollectionItemPhotos < ActiveRecord::Migration
  def change
    create_table :collection_item_photos do |t|
      t.integer :collection_item_id
      t.string  :data
      t.integer :position, default: 1

      t.timestamps
    end

    add_index :collection_item_photos, :collection_item_id
    add_index :collection_item_photos, :position
  end
end
