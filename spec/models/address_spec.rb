# == Schema Information
#
# Table name: addresses
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  district_id :integer
#  body        :string(255)
#  recipient   :string(255)
#  is_default  :boolean          default(FALSE)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Address do
  pending "add some examples to (or delete) #{__FILE__}"
end
