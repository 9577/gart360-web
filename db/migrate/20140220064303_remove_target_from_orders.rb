class RemoveTargetFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :target_id
    remove_column :orders, :target_type

    add_column :orders, :product_id, :integer

    add_index :orders, :product_id
  end
end
