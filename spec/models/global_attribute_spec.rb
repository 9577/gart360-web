# == Schema Information
#
# Table name: global_attributes
#
#  id                          :integer          not null, primary key
#  global_attribute_catalog_id :integer
#  value                       :string(255)
#  created_at                  :datetime
#  updated_at                  :datetime
#

require 'spec_helper'

describe GlobalAttribute do
  pending "add some examples to (or delete) #{__FILE__}"
end
