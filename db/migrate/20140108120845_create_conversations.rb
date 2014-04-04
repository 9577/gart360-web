class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.integer :user_id
      t.integer :target_user_id

      t.text    :content

      t.boolean :is_read, default: false
      t.boolean :is_archived, default: false

      t.timestamps
    end

    add_index :conversations, :user_id
    add_index :conversations, :target_user_id

    add_index :conversations, :is_read
    add_index :conversations, :is_archived
  end
end
