class CreateProductAttributes < ActiveRecord::Migration
  def change
    create_table :product_attributes do |t|
      t.integer :product_id
      t.string  :name
      t.string  :value

      t.timestamps
    end

    add_index :product_attributes, :product_id
  end
end
