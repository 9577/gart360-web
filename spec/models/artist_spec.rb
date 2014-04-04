# == Schema Information
#
# Table name: artists
#
#  id                :integer          not null, primary key
#  avatar            :string(255)
#  name              :string(255)
#  bio               :text
#  user_id           :integer
#  created_at        :datetime
#  updated_at        :datetime
#  educations_count  :integer          default(0)
#  awards_count      :integer          default(0)
#  exhibitions_count :integer          default(0)
#

require 'spec_helper'

describe Artist do
  pending "add some examples to (or delete) #{__FILE__}"
end
