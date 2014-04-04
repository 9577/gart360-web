class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string  :name
      t.string  :ancestry
      t.integer :position, default: 1

      t.timestamps
    end

    add_index :categories, :ancestry
    add_index :categories, :position
  end
end
