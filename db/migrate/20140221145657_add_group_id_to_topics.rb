class AddGroupIdToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :group_id, :integer
    add_index :topics, :group_id
  end
end
