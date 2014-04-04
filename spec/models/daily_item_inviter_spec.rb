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

require 'spec_helper'

describe DailyItemInviter do
  pending "add some examples to (or delete) #{__FILE__}"
end
