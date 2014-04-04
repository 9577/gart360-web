# == Schema Information
#
# Table name: product_attributes
#
#  id         :integer          not null, primary key
#  product_id :integer
#  name       :string(255)
#  value      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe ProductAttribute do
  pending "add some examples to (or delete) #{__FILE__}"
end
