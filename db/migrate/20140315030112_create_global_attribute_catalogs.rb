class CreateGlobalAttributeCatalogs < ActiveRecord::Migration
  def change
    create_table :global_attribute_catalogs do |t|
      t.string  :name
      t.integer :category_id

      t.timestamps
    end

    add_index :global_attribute_catalogs, :category_id
  end
end
