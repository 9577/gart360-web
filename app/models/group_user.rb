# == Schema Information
#
# Table name: group_users
#
#  id           :integer          not null, primary key
#  group_id     :integer
#  user_id      :integer
#  is_confirmed :boolean          default(FALSE)
#  created_at   :datetime
#  updated_at   :datetime
#

class GroupUser < ActiveRecord::Base

  belongs_to :group, counter_cache: :members_count

  belongs_to :user

  validates_uniqueness_of :user_id, scope: [:group_id]

  scope :joined, ->{ where(is_confirmed: true) }
  scope :pending,   ->{ where(is_confirmed: false) }

end
