# == Schema Information
#
# Table name: galleries
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  content        :text
#  artworks_count :integer          default(0)
#  user_id        :integer
#  created_at     :datetime
#  updated_at     :datetime
#  is_featured    :boolean          default(FALSE)
#

require 'spec_helper'

describe Gallery do
  pending "add some examples to (or delete) #{__FILE__}"
end
