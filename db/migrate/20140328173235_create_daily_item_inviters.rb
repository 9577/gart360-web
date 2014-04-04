class CreateDailyItemInviters < ActiveRecord::Migration
  def change
    create_table :daily_item_inviters do |t|
      t.integer :daily_item_id
      t.integer :wx_user_id

      t.timestamps
    end

    add_index :daily_item_inviters, :daily_item_id
    add_index :daily_item_inviters, :wx_user_id
  end
end
