# == Schema Information
#
# Table name: events
#
#  id             :integer          not null, primary key
#  subject        :string(255)
#  description    :text
#  user_id        :integer
#  start_at       :datetime
#  end_at         :datetime
#  images_count   :integer          default(0)
#  created_at     :datetime
#  updated_at     :datetime
#  users_count    :integer          default(0)
#  comments_count :integer          default(0)
#

require 'spec_helper'

describe Event do
  pending "add some examples to (or delete) #{__FILE__}"
end
