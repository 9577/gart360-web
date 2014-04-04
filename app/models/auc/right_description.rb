# == Schema Information
#
# Table name: right_descriptions
#
#  id         :integer          not null, primary key
#  right_id   :integer
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#  response   :text
#

class RightDescription < ActiveRecord::Base
  belongs_to :right
  scope :real, ->{ where("id is not null") }

  after_create :change_state_for_right
  after_update :confirm_right

  def change_state_for_right
    right.update(state: :pending)
  end

  def confirm_right
    right.confirm! unless right.confirmed?
  end
end
