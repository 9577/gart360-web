class CreateProductPhotos < ActiveRecord::Migration
  def change
    create_table :product_photos do |t|
      t.integer :product_id
      t.string  :data
      t.integer :position, default: 1

      t.timestamps
    end

    add_index :product_photos, :product_id
    add_index :product_photos, :position
  end
end
