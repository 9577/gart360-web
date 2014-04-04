# == Schema Information
#
# Table name: daily_item_invitees
#
#  id                    :integer          not null, primary key
#  daily_item_inviter_id :integer
#  wx_user_id            :integer
#  created_at            :datetime
#  updated_at            :datetime
#

class DailyItemInvitee < ActiveRecord::Base

  belongs_to :daily_item_inviter, class_name: 'DailyItemInviter', counter_cache: :invitees_count
  belongs_to :wx_user

  def inviter
    daily_item_inviter
  end
end
