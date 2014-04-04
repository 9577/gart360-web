# == Schema Information
#
# Table name: leaderboards
#
#  id              :integer          not null, primary key
#  target_id       :integer
#  target_type     :string(255)
#  type_identifier :string(255)
#  position        :integer
#  created_at      :datetime
#  updated_at      :datetime
#

require 'spec_helper'

describe Leaderboard do
  pending "add some examples to (or delete) #{__FILE__}"
end
