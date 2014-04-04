module Commentable
  extend ActiveSupport::Concern

  included do
    has_many :comments, as: :target
  end
  
end
