# == Schema Information
#
# Table name: target_followers
#
#  id          :integer          not null, primary key
#  target_id   :integer
#  target_type :string(255)
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe TargetFollower do
  pending "add some examples to (or delete) #{__FILE__}"
end
