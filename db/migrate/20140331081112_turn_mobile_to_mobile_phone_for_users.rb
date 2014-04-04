class TurnMobileToMobilePhoneForUsers < ActiveRecord::Migration
  def change
    remove_column :users, :mobile

    add_column :users, :mobile_phone, :string

    add_index :users, :mobile_phone
  end
end
