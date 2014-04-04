class AddRepliesCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :replies_count, :integer, default: 0
  end
end
