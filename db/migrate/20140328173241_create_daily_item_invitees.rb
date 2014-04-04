class CreateDailyItemInvitees < ActiveRecord::Migration
  def change
    create_table :daily_item_invitees do |t|
      t.integer :daily_item_inviter_id
      t.integer :wx_user_id

      t.timestamps
    end

    add_index :daily_item_invitees, :daily_item_inviter_id
    add_index :daily_item_invitees, :wx_user_id
  end
end
