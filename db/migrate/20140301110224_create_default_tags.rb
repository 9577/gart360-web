class CreateDefaultTags < ActiveRecord::Migration
  def change
    create_table :default_tags do |t|
      t.string :name
      t.string :ancestry

      t.timestamps
    end

    add_index :default_tags, :ancestry
  end
end
