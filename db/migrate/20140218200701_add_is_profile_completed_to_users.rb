class AddIsProfileCompletedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_profile_completed, :boolean, default: false
  end
end
