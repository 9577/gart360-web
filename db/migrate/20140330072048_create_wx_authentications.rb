class CreateWxAuthentications < ActiveRecord::Migration
  def change
    create_table :wx_authentications do |t|
      t.string :openid
      t.string :access_token
      t.string :refresh_token
      t.string :scope

      t.timestamps
    end
  end
end
