# == Schema Information
#
# Table name: collection_item_photos
#
#  id                 :integer          not null, primary key
#  collection_item_id :integer
#  data               :string(255)
#  position           :integer          default(1)
#  created_at         :datetime
#  updated_at         :datetime
#

require 'spec_helper'

describe CollectionItemPhoto do
  pending "add some examples to (or delete) #{__FILE__}"
end
