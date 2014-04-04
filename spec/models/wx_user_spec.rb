# == Schema Information
#
# Table name: wx_users
#
#  id         :integer          not null, primary key
#  openid     :string(255)
#  name       :string(255)
#  phone      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  nickname   :string(255)
#  sex        :integer
#  province   :string(255)
#  city       :string(255)
#  country    :string(255)
#  headimgurl :string(255)
#

require 'spec_helper'

describe WxUser do
  pending "add some examples to (or delete) #{__FILE__}"
end
