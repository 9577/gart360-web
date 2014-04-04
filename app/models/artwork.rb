# == Schema Information
#
# Table name: artworks
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  content        :text
#  images_count   :integer          default(0)
#  status         :integer
#  user_id        :integer
#  gallery_id     :integer
#  created_at     :datetime
#  updated_at     :datetime
#  comments_count :integer          default(0)
#  is_featured    :boolean          default(FALSE)
#  fans_count     :integer          default(0)
#

class Artwork < ActiveRecord::Base
  include Likable
  include Commentable
  include Recommendable
  include ActivityCommon

  validates :name, presence: true

  has_many  :images

  belongs_to :gallery, counter_cache: true
  belongs_to :user, counter_cache: true

  accepts_nested_attributes_for :images

  delegate :username, to: :user, prefix: true
  delegate :name, to: :gallery, prefix: true

  searchable do
    string :klass do
      self.class.name
    end
    text :name,  stored: true
    text :content, stored: true
  end

  def user_name
    user_username
  end

  def avatar_url(width=200, height=200)
    images.first.try(:gallery_img_url, width, height)
  end

  before_create :build_user

  def build_user
    self.user_id = gallery.user_id
  end


end
