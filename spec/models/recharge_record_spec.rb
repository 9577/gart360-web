# == Schema Information
#
# Table name: recharge_records
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  amount      :decimal(20, 2)
#  state       :string(255)
#  finished_at :datetime
#  created_at  :datetime
#  updated_at  :datetime
#  code        :string(255)
#  discount    :decimal(20, 2)   default(0.0)
#

require 'spec_helper'

describe RechargeRecord do
  pending "add some examples to (or delete) #{__FILE__}"
end
