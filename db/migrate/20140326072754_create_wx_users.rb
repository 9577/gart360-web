class CreateWxUsers < ActiveRecord::Migration
  def change
    create_table :wx_users do |t|
      t.string :openid
      t.string :name
      t.string :phone

      t.timestamps
    end
  end
end
