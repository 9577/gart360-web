class CreateWeixinMenus < ActiveRecord::Migration
  def change
    create_table :weixin_menus do |t|
      t.string :menu_type
      t.string :name
      t.string :key
      t.string :url
      t.integer :sequence

      t.timestamps
    end
  end
end
