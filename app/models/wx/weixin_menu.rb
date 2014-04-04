# == Schema Information
#
# Table name: weixin_menus
#
#  id         :integer          not null, primary key
#  menu_type  :string(255)
#  name       :string(255)
#  key        :string(255)
#  url        :string(255)
#  sequence   :integer
#  created_at :datetime
#  updated_at :datetime
#

class WeixinMenu < ActiveRecord::Base
  validates_presence_of :key, if: -> { menu_type == 'click' }
  validates_presence_of :url, if: -> { menu_type == 'view' }

  has_many :weixin_sub_menus, -> {order 'sequence asc'}, dependent: :destroy
  accepts_nested_attributes_for :weixin_sub_menus, allow_destroy: true

  MENU_TYPES = {
    click: '事件触发',
    view:  '链接跳转'
  }

  KEYS = {
    bargain:   '每日一砍',
    pictorial: '画报',
    mine:      '我的'
  }

  def human_type
    menu_type.present? ? MENU_TYPES[menu_type.to_sym] : ''
  end

  def human_key
    key.present? ? KEYS[key.to_sym] : ''
  end
end
