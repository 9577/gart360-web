# == Schema Information
#
# Table name: awards
#
#  id         :integer          not null, primary key
#  artwork    :string(255)
#  content    :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  city_id    :integer
#  year       :integer
#  artist_id  :integer
#  city_name  :string(255)
#

require 'spec_helper'

describe Award do
  pending "add some examples to (or delete) #{__FILE__}"
end
