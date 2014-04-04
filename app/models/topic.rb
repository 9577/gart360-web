# == Schema Information
#
# Table name: topics
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  body           :text
#  user_id        :integer
#  replies_count  :integer          default(0)
#  is_recommended :boolean          default(FALSE)
#  created_at     :datetime
#  updated_at     :datetime
#  group_id       :integer
#

class Topic < ActiveRecord::Base

  attr_readonly :replies_count

  validates :title, :body, :user_id, :group_id, presence: true

  belongs_to :user
  belongs_to :group, counter_cache: true
  has_many :replies

  include ActivityCommon

  scope :recommended, -> { where(is_recommended: true) }
  scope :latest, -> { order('created_at DESC') }
  scope :hot, -> { order('replies_count DESC') }

  searchable do
    string :klass do
      self.class.name
    end
    text :title, stored: true
    text :body,  stored: true
  end
end
