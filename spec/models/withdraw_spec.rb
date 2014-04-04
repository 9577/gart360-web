# == Schema Information
#
# Table name: withdraws
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  code           :string(255)
#  transferred_at :datetime
#  amount         :decimal(20, 2)
#  state          :string(255)
#  card_number    :string(255)
#  bank_name      :string(255)
#  name           :string(255)
#  mobile         :string(255)
#  description    :text
#  created_at     :datetime
#  updated_at     :datetime
#  finished_at    :datetime
#  rejected_at    :datetime
#  processing_at  :datetime
#

require 'spec_helper'

describe Withdraw do
  pending "add some examples to (or delete) #{__FILE__}"
end
