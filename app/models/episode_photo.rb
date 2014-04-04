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

class EpisodePhoto < ActiveRecord::Base
  belongs_to :episode, counter_cache: :photos_count
  
  def image_url(width, height)
    data + "?imageView2/1/w/#{width}/h/#{height}/format/jpg"
  end
end
