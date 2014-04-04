# == Schema Information
#
# Table name: investments
#
#  id         :integer          not null, primary key
#  product_id :integer
#  user_id    :integer
#  quantity   :integer          default(1)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Investment do
  pending "add some examples to (or delete) #{__FILE__}"
end
