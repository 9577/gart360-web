class RemoveContentFromConversations < ActiveRecord::Migration
  def change
    remove_column :conversations, :content
  end
end
