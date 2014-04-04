# == Schema Information
#
# Table name: weixin_sub_menus
#
#  id             :integer          not null, primary key
#  weixin_menu_id :integer
#  menu_type      :string(255)
#  name           :string(255)
#  key            :string(255)
#  url            :string(255)
#  sequence       :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class WeixinSubMenu < ActiveRecord::Base
  belongs_to :weixin_menu

  def human_type
    menu_type.present? ? WeixinMenu::MENU_TYPES[menu_type.to_sym] : ''
  end

  def human_key
    key.present? ? WeixinMenu::KEYS[key.to_sym] : ''
  end
end
