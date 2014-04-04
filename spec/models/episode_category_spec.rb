# == Schema Information
#
# Table name: episode_categories
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  episodes_count :integer          default(1)
#  created_at     :datetime
#  updated_at     :datetime
#

require 'spec_helper'

describe EpisodeCategory do
  pending "add some examples to (or delete) #{__FILE__}"
end
