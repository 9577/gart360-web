class AddConversationsCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :conversations_count, :integer, default: 0
  end
end
