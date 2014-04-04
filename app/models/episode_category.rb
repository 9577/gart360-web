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

class EpisodeCategory < ActiveRecord::Base
end
