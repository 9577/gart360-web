class CreateTargetFollowers < ActiveRecord::Migration
  def change
    create_table :target_followers do |t|
      t.integer :target_id
      t.string  :target_type
      t.integer :user_id

      t.timestamps
    end

    add_index :target_followers, [ :target_id, :target_type ]
    add_index :target_followers, :user_id
  end
end
