# == Schema Information
#
# Table name: collection_item_photos
#
#  id                 :integer          not null, primary key
#  collection_item_id :integer
#  data               :string(255)
#  position           :integer          default(1)
#  created_at         :datetime
#  updated_at         :datetime
#

class CollectionItemPhoto < ActiveRecord::Base

  belongs_to :collection_item, counter_cache: :photos_count

  def image_url(width, height)
    if data
      data + "?imageView2/1/w/#{width}/h/#{height}/format/jpg"
    else
      data
    end
  end

end
