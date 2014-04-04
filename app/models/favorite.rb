# == Schema Information
#
# Table name: favorites
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  target_id   :integer
#  target_type :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Favorite < ActiveRecord::Base

  validates :user_id, uniqueness: { scope: [:target_id, :target_type]  }

  belongs_to :target, polymorphic: true, counter_cache: :favorited_count

  belongs_to :user

end
