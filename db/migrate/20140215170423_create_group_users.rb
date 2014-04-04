class CreateGroupUsers < ActiveRecord::Migration
  def change
    create_table :group_users do |t|
      t.integer :group_id
      t.integer :user_id
      t.boolean :is_confirmed, default: false

      t.timestamps
    end

    add_index :group_users, :group_id
    add_index :group_users, :user_id
    add_index :group_users, :is_confirmed
  end
end
