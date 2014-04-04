class ChangeEmailForUsers < ActiveRecord::Migration
  def change
    remove_index :users, :email
    remove_index :users, :mobile

    add_index :users, :email
    add_index :users, :mobile
  end
end
