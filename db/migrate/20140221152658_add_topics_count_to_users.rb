class AddTopicsCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :topics_count, :integer, default: 0
  end
end
