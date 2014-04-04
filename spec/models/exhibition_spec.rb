# == Schema Information
#
# Table name: exhibitions
#
#  id           :integer          not null, primary key
#  artist_id    :integer
#  user_id      :integer
#  name         :string(255)
#  artwork_name :string(255)
#  year         :integer
#  city_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#  city_name    :string(255)
#

require 'spec_helper'

describe Exhibition do
  pending "add some examples to (or delete) #{__FILE__}"
end
