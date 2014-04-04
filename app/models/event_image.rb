# == Schema Information
#
# Table name: event_images
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  image_id   :integer
#  position   :integer          default(1)
#  created_at :datetime
#  updated_at :datetime
#

class EventImage < ActiveRecord::Base

  belongs_to :event, counter_cache: :images_count
  belongs_to :image

end
