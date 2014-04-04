# == Schema Information
#
# Table name: product_photos
#
#  id         :integer          not null, primary key
#  product_id :integer
#  data       :string(255)
#  position   :integer          default(1)
#  created_at :datetime
#  updated_at :datetime
#

class ProductPhoto < ActiveRecord::Base

  validates :data, presence: true

  belongs_to :product, counter_cache: :photos_count

  default_scope { order(:position) }

  def image_url(width, height)
    data + "?imageView2/1/w/#{width}/h/#{height}/format/jpg"
  end

end
