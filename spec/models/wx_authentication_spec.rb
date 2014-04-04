# == Schema Information
#
# Table name: wx_authentications
#
#  id            :integer          not null, primary key
#  openid        :string(255)
#  access_token  :string(255)
#  refresh_token :string(255)
#  scope         :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

require 'spec_helper'

describe WxAuthentication do
  pending "add some examples to (or delete) #{__FILE__}"
end
