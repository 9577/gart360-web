# == Schema Information
#
# Table name: daily_item_inviters
#
#  id             :integer          not null, primary key
#  daily_item_id  :integer
#  wx_user_id     :integer
#  created_at     :datetime
#  updated_at     :datetime
#  invitees_count :integer          default(0)
#

class DailyItemInviter < ActiveRecord::Base

  attr_readonly :invitees_count

  belongs_to :daily_item, counter_cache: :inviters_count
  belongs_to :wx_user

  has_many :invitees, class_name: 'DailyItemInvitee'

  def current_price
    ((1 - 0.02 * invitees_count) * daily_item.price).round
  end

end
