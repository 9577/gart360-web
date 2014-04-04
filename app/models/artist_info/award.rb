# == Schema Information
#
# Table name: awards
#
#  id         :integer          not null, primary key
#  artwork    :string(255)
#  content    :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  city_id    :integer
#  year       :integer
#  artist_id  :integer
#  city_name  :string(255)
#

class Award < ActiveRecord::Base

  validates :artwork, :content, :year, :city_id, presence: true

  belongs_to :user
  belongs_to :artist, counter_cache: true
  belongs_to :city
end
