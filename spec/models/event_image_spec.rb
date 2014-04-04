# == Schema Information
#
# Table name: event_images
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  image_id   :integer
#  position   :integer          default(1)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe EventImage do
  pending "add some examples to (or delete) #{__FILE__}"
end
