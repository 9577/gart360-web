class ChangeColumnsForConversations < ActiveRecord::Migration
  def change
    rename_column :conversations, :user_id, :sender_id
    rename_column :conversations, :target_user_id, :recipient_id

    add_column :conversations, :type_identifier, :string

    add_index :conversations, :type_identifier
  end
end
