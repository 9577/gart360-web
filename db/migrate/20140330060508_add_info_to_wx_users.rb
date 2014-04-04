class AddInfoToWxUsers < ActiveRecord::Migration
  def change
    add_column :wx_users, :nickname, :string
    add_column :wx_users, :sex, :integer
    add_column :wx_users, :province, :string
    add_column :wx_users, :city, :string
    add_column :wx_users, :country, :string
    add_column :wx_users, :headimgurl, :string
  end
end
