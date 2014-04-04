class CreateProductOwners < ActiveRecord::Migration
  def change
    create_table :product_owners do |t|
      t.integer :product_id
      t.string  :name
      t.string  :avatar
      t.text    :body

      t.timestamps
    end

    add_index :product_owners, :product_id
  end
end
