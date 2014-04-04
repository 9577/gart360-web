class AddEpisodeCategoryIdToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :episode_category_id, :integer

    add_index :episodes, :episode_category_id
  end
end
