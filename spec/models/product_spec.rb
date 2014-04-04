# == Schema Information
#
# Table name: products
#
#  id              :integer          not null, primary key
#  type            :string(255)
#  title           :string(255)
#  user_id         :integer
#  base_price      :decimal(20, 2)
#  current_price   :decimal(20, 2)
#  per_price       :decimal(20, 2)
#  photos_count    :integer          default(0)
#  bids_count      :integer          default(0)
#  orders_count    :integer          default(0)
#  auction_id      :integer
#  created_at      :datetime
#  updated_at      :datetime
#  category_id     :integer
#  start_at        :datetime
#  end_at          :datetime
#  deposit         :decimal(20, 2)   default(100.0)
#  type_identifier :string(255)
#  is_investable   :boolean          default(FALSE)
#  per_coin        :integer          default(0)
#  state           :string(255)
#  story           :text
#  delay_time      :integer          default(5)
#

require 'spec_helper'

describe Product do
  pending "add some examples to (or delete) #{__FILE__}"
end
