class CreateEpisodeCategories < ActiveRecord::Migration
  def change
    create_table :episode_categories do |t|
      t.string  :name
      t.integer :episodes_count, default: 1

      t.timestamps
    end
  end
end
