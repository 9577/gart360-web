class AddColumnsToCollectionItems < ActiveRecord::Migration
  def change
    add_column :collection_items, :is_featured, :boolean, default: false
    add_column :collection_items, :state, :string
  end
end
