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

require 'spec_helper'

describe WeixinMenu do
  pending "add some examples to (or delete) #{__FILE__}"
end
