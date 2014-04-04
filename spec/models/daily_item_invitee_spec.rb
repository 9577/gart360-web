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

require 'spec_helper'

describe DailyItemInvitee do
  pending "add some examples to (or delete) #{__FILE__}"
end
