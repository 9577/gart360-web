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

class WxAuthentication < ActiveRecord::Base
  belongs_to :wx_user, foreign_key: :openid
end
