class CreateEventUsers < ActiveRecord::Migration
  def change
    create_table :event_users do |t|
      t.integer :event_id
      t.integer :user_id

      t.timestamps
    end

    add_index :event_users, :event_id
    add_index :event_users, :user_id
  end
end
