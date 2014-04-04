class AddTargetToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :target_id, :integer
    add_column :orders, :target_type, :string

    add_index :orders, [:target_id, :target_type]
  end
end
