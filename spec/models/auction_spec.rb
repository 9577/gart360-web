# == Schema Information
#
# Table name: auctions
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  banner         :string(255)
#  start_at       :datetime
#  end_at         :datetime
#  products_count :integer          default(0)
#  created_at     :datetime
#  updated_at     :datetime
#  state          :string(255)
#  is_picked      :boolean          default(FALSE)
#

require 'spec_helper'

describe Auction do
  pending "add some examples to (or delete) #{__FILE__}"
end
