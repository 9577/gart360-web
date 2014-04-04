# == Schema Information
#
# Table name: educations
#
#  id            :integer          not null, primary key
#  artist_id     :integer
#  user_id       :integer
#  background    :string(255)
#  school        :string(255)
#  major         :string(255)
#  entrance_date :date
#  created_at    :datetime
#  updated_at    :datetime
#

class Education < ActiveRecord::Base

  belongs_to :artist, counter_cache: true

  belongs_to :user
  
  before_create :build_user

  def build_user
    self.user_id = self.artist.user_id
  end

end
