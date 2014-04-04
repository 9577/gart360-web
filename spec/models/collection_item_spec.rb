# == Schema Information
#
# Table name: collection_items
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  user_id      :integer
#  description  :text
#  created_at   :datetime
#  updated_at   :datetime
#  photos_count :integer          default(0)
#  is_featured  :boolean          default(FALSE)
#  state        :string(255)
#

require 'spec_helper'

describe CollectionItem do
  pending "add some examples to (or delete) #{__FILE__}"
end
