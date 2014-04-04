class CreateGlobalAttributes < ActiveRecord::Migration
  def change
    create_table :global_attributes do |t|
      t.integer :global_attribute_catalog_id
      t.string  :value

      t.timestamps
    end

    add_index :global_attributes, :global_attribute_catalog_id
  end
end
