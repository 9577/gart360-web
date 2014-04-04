# == Schema Information
#
# Table name: episode_photos
#
#  id         :integer          not null, primary key
#  episode_id :integer
#  data       :string(255)
#  position   :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe EpisodePhoto do
  pending "add some examples to (or delete) #{__FILE__}"
end
