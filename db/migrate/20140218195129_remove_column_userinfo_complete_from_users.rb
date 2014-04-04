class RemoveColumnUserinfoCompleteFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :userinfo_complete
  end
end
