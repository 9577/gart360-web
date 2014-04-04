# == Schema Information
#
# Table name: global_images
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  data        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  target_type :string(255)
#

require 'spec_helper'

describe GlobalImage do
  pending "add some examples to (or delete) #{__FILE__}"
end
