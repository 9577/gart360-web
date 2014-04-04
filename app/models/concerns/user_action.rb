module UserAction
  extend ActiveSupport::Concern

  included do
    has_many :target_followed, class_name: 'TargetFollower'
    has_many :followed_users, through: :target_followed, source: :target, source_type: 'User'

    has_many :likes
    has_many :liked_artworks, through: :likes, source: :target, source_type: 'Artwork'
  end

  def feed_ids
    followed_users.pluck(:id) << self.id
  end

  def broadcast_ids
    followers.pluck(:id) << self.id
  end

  ## 关注
  ## =================================
  def follow!(target)
    unless is_following?(target)
      target.target_followers.create!(user_id: id) && reload
    end
  end

  def unfollow!(target)
    if is_following?(target)
      target.target_followers.where(user_id: id).first.try(:destroy)
    end
  end

  def is_following?(target)
    !!target.target_followers.where(user_id: id).first
  end
  ## =================================

  ## 喜欢
  ## =================================
  def like! target
    unless is_liking?(target)
      target.likes.create(user_id: id) && reload
    end
  end

  def unlike! target
    if is_liking?(target)
      target.likes.where(user_id: id).first.try(:destroy)
    end
  end

  def is_liking?(target)
    !!target.likes.where(user_id: id).first
  end
  ## =================================

  ## 收藏
  ## =================================
  def collect! target
    unless is_collecting?(target)
      target.favourites.create(user_id: id) && reload
    end
  end

  def uncollect! target
    if is_collecting?(target) 
      target.favourites.where(user_id: id).first.try(:destroy)
    end
  end

  def is_collecting?(target)
    !!target.favourites.where(user_id: id).first
  end
  ## =================================
  
end