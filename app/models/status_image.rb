# == Schema Information
#
# Table name: status_images
#
#  id         :integer          not null, primary key
#  status_id  :integer
#  data       :string(255)
#  position   :integer          default(1)
#  created_at :datetime
#  updated_at :datetime
#

class StatusImage < ActiveRecord::Base

  validates :data, presence: true

  belongs_to :status, counter_cache: :images_count

  def data_url(width=80, height=80)
    data + "?imageView2/1/w/#{width}/h/#{height}/format/jpg"
  end
end
