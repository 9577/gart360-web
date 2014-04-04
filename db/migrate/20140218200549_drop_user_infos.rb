class DropUserInfos < ActiveRecord::Migration
  def change
    drop_table :user_infos
  end
end
