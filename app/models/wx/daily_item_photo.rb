# == Schema Information
#
# Table name: daily_item_photos
#
#  id            :integer          not null, primary key
#  daily_item_id :integer
#  data          :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  position      :integer          default(1)
#

class DailyItemPhoto < ActiveRecord::Base
  belongs_to :daily_item, counter_cache: :photos_count
  def image_url(width, height)
    data + "?imageView2/1/w/#{width}/h/#{height}/format/jpg"
  end

  def weixin_image_url
    image_url(300, 200)
  end
end
