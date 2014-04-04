# == Schema Information
#
# Table name: artworks
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  content        :text
#  images_count   :integer          default(0)
#  status         :integer
#  user_id        :integer
#  gallery_id     :integer
#  created_at     :datetime
#  updated_at     :datetime
#  comments_count :integer          default(0)
#  is_featured    :boolean          default(FALSE)
#  fans_count     :integer          default(0)
#

require 'spec_helper'

describe Artwork do
  pending "add some examples to (or delete) #{__FILE__}"
end
