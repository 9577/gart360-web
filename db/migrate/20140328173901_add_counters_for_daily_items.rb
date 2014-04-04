class AddCountersForDailyItems < ActiveRecord::Migration
  def change
    add_column :daily_items, :inviters_count, :integer, default: 0
    add_column :daily_item_inviters, :invitees_count, :integer, default: 0

    add_index :daily_item_inviters, :invitees_count
  end
end
