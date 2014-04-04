class CreateCollectionItems < ActiveRecord::Migration
  def change
    create_table :collection_items do |t|
      t.string  :name
      t.integer :user_id
      t.text    :description

      t.timestamps
    end

    add_index :collection_items, :user_id
  end
end
