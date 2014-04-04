class AddJoinedEventsCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :joined_events_count, :integer, default: 0
  end
end
