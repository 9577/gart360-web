# == Schema Information
#
# Table name: events
#
#  id             :integer          not null, primary key
#  subject        :string(255)
#  description    :text
#  user_id        :integer
#  start_at       :datetime
#  end_at         :datetime
#  images_count   :integer          default(0)
#  created_at     :datetime
#  updated_at     :datetime
#  users_count    :integer          default(0)
#  comments_count :integer          default(0)
#

class Event < ActiveRecord::Base
  include Commentable
  include ActivityCommon

  attr_readonly :images_count, :users_count

  validates :subject, :description, :user_id, :start_at, :end_at, presence: true

  has_many :event_images
  has_many :images, through: :event_images

  belongs_to :user

  delegate :username, to: :user, prefix: true

  scope :pending, ->{ where('start_at > ?', Time.zone.now) }
  scope :active,  ->{ where('start_at < ? AND end_at > ?', Time.zone.now, Time.zone.now) }
  scope :closed,  ->{ where('end_at < ?', Time.zone.now) }

  searchable do
    string :klass do
      self.class.name
    end
    text :subject,  stored: true
    text :description, stored: true
  end

  def user_name
    user_username
  end

  def pending?
    start_at > Time.zone.now
  end

  def active?
    start_at < Time.zone.now && end_at > Time.zone.now
  end

  def cover_url
    images.first.gallery_img_url(200, 200)
  end

  def closed?
    end_at < Time.zone.now
  end

end
