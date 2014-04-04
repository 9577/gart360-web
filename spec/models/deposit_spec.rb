# == Schema Information
#
# Table name: deposits
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  freezed_at   :datetime
#  unfreezed_at :datetime
#  removed_at   :datetime
#  state        :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  product_id   :integer
#

require 'spec_helper'

describe Deposit do
  pending "add some examples to (or delete) #{__FILE__}"
end
