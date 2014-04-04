class CreateWikis < ActiveRecord::Migration
  def change
    create_table :wikis do |t|
      t.string :title
      t.text   :body

      t.integer :wiki_category_id

      t.timestamps
    end

    add_index :wikis, :wiki_category_id
  end
end
