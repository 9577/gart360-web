# == Schema Information
#
# Table name: exchanges
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  amount     :decimal(20, 2)
#  coin       :integer
#  created_at :datetime
#  updated_at :datetime
#

class Exchange < ActiveRecord::Base
end
