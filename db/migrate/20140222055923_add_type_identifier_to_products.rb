class AddTypeIdentifierToProducts < ActiveRecord::Migration
  def change
    add_column :products, :type_identifier, :string
    add_index :products, :type_identifier
  end
end
