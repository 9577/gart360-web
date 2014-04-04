class CreateProductDetails < ActiveRecord::Migration
  def change
    create_table :product_details do |t|
      t.integer :product_id
      t.text :body

      t.timestamps
    end

    add_index :product_details, :product_id
  end
end
