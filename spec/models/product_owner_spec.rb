# == Schema Information
#
# Table name: product_owners
#
#  id         :integer          not null, primary key
#  product_id :integer
#  name       :string(255)
#  avatar     :string(255)
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe ProductOwner do
  pending "add some examples to (or delete) #{__FILE__}"
end
