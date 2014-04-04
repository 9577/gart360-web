class CreateWikiCategories < ActiveRecord::Migration
  def change
    create_table :wiki_categories do |t|
      t.string  :name
      t.integer :wikis_count, default: 0

      t.timestamps
    end
  end
end
