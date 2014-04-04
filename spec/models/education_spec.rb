# == Schema Information
#
# Table name: educations
#
#  id            :integer          not null, primary key
#  artist_id     :integer
#  user_id       :integer
#  background    :string(255)
#  school        :string(255)
#  major         :string(255)
#  entrance_date :date
#  created_at    :datetime
#  updated_at    :datetime
#

require 'spec_helper'

describe Education do
  pending "add some examples to (or delete) #{__FILE__}"
end
