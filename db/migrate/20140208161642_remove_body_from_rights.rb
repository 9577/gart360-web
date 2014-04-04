class RemoveBodyFromRights < ActiveRecord::Migration
  def change
    remove_column :rights, :body
  end
end
