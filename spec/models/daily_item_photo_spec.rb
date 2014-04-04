# == Schema Information
#
# Table name: daily_item_photos
#
#  id            :integer          not null, primary key
#  daily_item_id :integer
#  data          :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  position      :integer          default(1)
#

require 'spec_helper'

describe DailyItemPhoto do
  pending "add some examples to (or delete) #{__FILE__}"
end
