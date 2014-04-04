# == Schema Information
#
# Table name: target_followers
#
#  id          :integer          not null, primary key
#  target_id   :integer
#  target_type :string(255)
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class TargetFollower < ActiveRecord::Base

  validates :user_id, uniqueness: { scope: [:target_id, :target_type]  }

  belongs_to :target, polymorphic: true, counter_cache: :followers_count

  belongs_to :user

end
