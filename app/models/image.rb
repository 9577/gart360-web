# == Schema Information
#
# Table name: images
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  img        :string(255)
#  artwork_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Image < ActiveRecord::Base

  validates :img, presence: true

  belongs_to :artwork, counter_cache: true

  def gallery_img_url(width, height)
    if height.nil?
      img << "?imageView2/2/w/#{width}/format/jp"
    else
      img << "?imageView2/1/w/#{width}/h/#{height}/format/jp"
    end
  end
  
end
