# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  body        :text
#  target_id   :integer
#  target_type :string(255)
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Comment < ActiveRecord::Base

  validates :body, presence: true

  belongs_to :target, polymorphic: true, counter_cache: :comments_count

  belongs_to :user

  default_scope { order('created_at DESC') }

end
