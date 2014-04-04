# == Schema Information
#
# Table name: likes
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  target_id   :integer
#  target_type :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Like < ActiveRecord::Base

  validates :user_id, uniqueness: { scope: [:target_id, :target_type]  }

  belongs_to :target, polymorphic: true, counter_cache: :fans_count

  belongs_to :user

  paginates_per 1000
end
