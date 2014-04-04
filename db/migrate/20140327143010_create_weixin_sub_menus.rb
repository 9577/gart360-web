class CreateWeixinSubMenus < ActiveRecord::Migration
  def change
    create_table :weixin_sub_menus do |t|
      t.integer :weixin_menu_id
      t.string :menu_type
      t.string :name
      t.string :key
      t.string :url
      t.integer :sequence

      t.timestamps
    end
  end
end
