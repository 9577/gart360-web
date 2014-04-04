# == Schema Information
#
# Table name: episodes
#
#  id                  :integer          not null, primary key
#  title               :string(255)
#  body                :text
#  is_featured         :boolean          default(FALSE)
#  photos_count        :integer          default(0)
#  created_at          :datetime
#  updated_at          :datetime
#  episode_category_id :integer
#

class Episode < ActiveRecord::Base

  validates :title, :body, presence: true
  
  has_many :photos, class_name: 'EpisodePhoto'
  accepts_nested_attributes_for :photos

  def mark_as_featured!
    update_attribute(:is_featured, true)
  end

  def mark_as_unfeatured!
    update_attribute(:is_featured, false)
  end

end
