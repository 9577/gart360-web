# == Schema Information
#
# Table name: daily_items
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  description    :text
#  price          :decimal(20, 2)   default(0.0)
#  start_at       :date
#  created_at     :datetime
#  updated_at     :datetime
#  photos_count   :integer          default(0)
#  inviters_count :integer          default(0)
#

require 'spec_helper'

describe DailyItem do
  pending "add some examples to (or delete) #{__FILE__}"
end
