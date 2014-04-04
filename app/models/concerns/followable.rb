module Followable
  extend ActiveSupport::Concern

  included do
    has_many :target_followers, as: :target
    has_many :followers, through: :target_followers, source: :user
  end

  def followed_by?(user)
    return false if user.nil?

    !!target_followers.where(user_id: user.id).first
  end

  def add_follower user
    TargetFollower.find_or_create_by user_id: user.id, target_id: self.id, target_type: self.class.name
  end

  def remove_follower user
    target_follower = TargetFollower.find_by user_id: user.id, target_id: self.id, target_type: self.class.name
    target_follower.destroy if target_follower.present?
  end
end
