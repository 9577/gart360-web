class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.string  :title
      t.text    :body
      t.boolean :is_featured, default: false
      t.integer :photos_count, default: 0

      t.timestamps
    end

    add_index :episodes, :is_featured
  end
end
