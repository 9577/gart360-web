class AddCollectionItemsCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :collection_items_count, :integer, default: 0
  end
end
