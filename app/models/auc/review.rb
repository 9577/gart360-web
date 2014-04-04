# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  product_id :integer
#  expert_id  :integer
#  body       :text
#  position   :integer          default(1)
#  created_at :datetime
#  updated_at :datetime
#

class Review < ActiveRecord::Base

  # validates :body, presence: true

  belongs_to :product
  belongs_to :expert

  default_scope { order(:id) }

end
