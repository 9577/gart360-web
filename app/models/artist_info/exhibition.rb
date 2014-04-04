# == Schema Information
#
# Table name: exhibitions
#
#  id           :integer          not null, primary key
#  artist_id    :integer
#  user_id      :integer
#  name         :string(255)
#  artwork_name :string(255)
#  year         :integer
#  city_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#  city_name    :string(255)
#

class Exhibition < ActiveRecord::Base

  validates :name, :artwork_name, :year, :city_id, presence: true

  belongs_to :artist, counter_cache: true
  belongs_to :user

  belongs_to :city

end
