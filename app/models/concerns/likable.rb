module Likable
  extend ActiveSupport::Concern

  included do
    has_many :likes, as: :target
    has_many :fans, through: :likes, source: :user
  end

  def liked_by?(user)
    return false if user.nil?

    !!likes.where(user_id: user.id).first
  end
end
