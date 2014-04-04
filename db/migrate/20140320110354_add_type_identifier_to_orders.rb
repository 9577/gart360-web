class AddTypeIdentifierToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :type_identifier, :string
    add_index :orders, :type_identifier
  end
end
