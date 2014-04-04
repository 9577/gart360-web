# == Schema Information
#
# Table name: bids
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  price        :decimal(20, 2)
#  created_at   :datetime
#  updated_at   :datetime
#  is_anonymous :boolean
#  product_id   :integer
#  state        :string(255)
#  is_deleted   :boolean          default(FALSE)
#

require 'spec_helper'

describe Bid do
  pending "add some examples to (or delete) #{__FILE__}"
end
