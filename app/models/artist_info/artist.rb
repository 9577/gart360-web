# == Schema Information
#
# Table name: artists
#
#  id                :integer          not null, primary key
#  avatar            :string(255)
#  name              :string(255)
#  bio               :text
#  user_id           :integer
#  created_at        :datetime
#  updated_at        :datetime
#  educations_count  :integer          default(0)
#  awards_count      :integer          default(0)
#  exhibitions_count :integer          default(0)
#

class Artist < ActiveRecord::Base

  validates :name, :avatar, :bio, presence: true
  belongs_to :user

  with_options dependent: :destroy do |artist|
    artist.has_many :educations
    artist.has_many :awards
    artist.has_many :exhibitions
  end

  accepts_nested_attributes_for :educations, reject_if: :all_blank
  accepts_nested_attributes_for :awards, reject_if: :all_blank
  accepts_nested_attributes_for :exhibitions, reject_if: :all_blank

  def avatar_url(width=176, height=176)
    avatar.blank? ? 'sns/user-header-bg.png' : avatar << "?imageView2/1/w/#{width}/h/#{height}/format/jpg"
  end
end
