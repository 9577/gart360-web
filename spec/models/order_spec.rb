# == Schema Information
#
# Table name: orders
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  code            :string(255)
#  price           :decimal(20, 2)   default(0.0)
#  delivery_code   :string(255)
#  state           :string(255)
#  delivered_at    :datetime
#  finished_at     :datetime
#  closed_at       :datetime
#  paid_at         :datetime
#  created_at      :datetime
#  updated_at      :datetime
#  product_id      :integer
#  is_auction      :boolean          default(FALSE)
#  delivery_price  :decimal(20, 2)   default(0.0)
#  target_id       :integer
#  target_type     :string(255)
#  type_identifier :string(255)
#  address_id      :integer
#

require 'spec_helper'

describe Order do
  pending "add some examples to (or delete) #{__FILE__}"
end
