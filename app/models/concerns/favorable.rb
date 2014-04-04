module Favorable
  extend ActiveSupport::Concern

  included do
    has_many :favourites, as: :target
    has_many :favourited_users, through: :favourites, source: :user
  end

  def favourited_by?(user)
    return false if user.nil?

    !!favourites.where(user_id: user.id).first
  end
end
