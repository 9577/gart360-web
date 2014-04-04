# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  product_id :integer
#  expert_id  :integer
#  body       :text
#  position   :integer          default(1)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Review do
  pending "add some examples to (or delete) #{__FILE__}"
end
