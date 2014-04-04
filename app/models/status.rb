# == Schema Information
#
# Table name: statuses
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  body         :text
#  created_at   :datetime
#  updated_at   :datetime
#  images_count :integer          default(0)
#

class Status < ActiveRecord::Base
  include ActivityCommon

  attr_readonly :images_count

  validates :body, presence: true

  has_many :images, class_name: 'StatusImage'

  belongs_to :user, counter_cache: true

  delegate :username, to: :user, prefix: true

  accepts_nested_attributes_for :images, reject_if: proc { |attributes| attributes['data'].blank? }

  default_scope { order('created_at DESC') }

  def user_name
    user_username
  end

end
