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

class WxUser < ActiveRecord::Base
  def inviter?(daily_item_inviter_wx_user_id)
    daily_item_inviter_wx_user_id == self.id
  end

  def has_cut?(daily_item_inviter_id)
    DailyItemInvitee.find_by(daily_item_inviter_id: daily_item_inviter_id, wx_user_id: self.id)
  end

  def has_daily_item?(daily_item_id)
    DailyItemInviter.find_by(daily_item_id: daily_item_id, wx_user_id: self.id)
  end
end
