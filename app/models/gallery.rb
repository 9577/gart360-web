# == Schema Information
#
# Table name: galleries
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  content        :text
#  artworks_count :integer          default(0)
#  user_id        :integer
#  created_at     :datetime
#  updated_at     :datetime
#  is_featured    :boolean          default(FALSE)
#

class Gallery < ActiveRecord::Base
  include Recommendable

  acts_as_taggable

  attr_readonly :artworks

  validates :name, :content, presence: true

  has_many :artworks,dependent: :destroy

  belongs_to :user, counter_cache: true

  delegate :username, to: :user, prefix: true

  searchable do
    string :klass do
      self.class.name
    end
    text :name,    stored: true
    text :content, stored: true
  end

  def cover_artwork_images
    artworks.limit(3).map(&:avatar_url)
  end

  def user_name
    user_username
  end
end
