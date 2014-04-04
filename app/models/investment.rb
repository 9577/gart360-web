# == Schema Information
#
# Table name: investments
#
#  id         :integer          not null, primary key
#  product_id :integer
#  user_id    :integer
#  quantity   :integer          default(1)
#  created_at :datetime
#  updated_at :datetime
#

class Investment < ActiveRecord::Base
end
