# == Schema Information
#
# Table name: images
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  img        :string(255)
#  artwork_id :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Image do
  pending "add some examples to (or delete) #{__FILE__}"
end
