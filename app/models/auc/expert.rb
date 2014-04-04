# == Schema Information
#
# Table name: experts
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  avatar      :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  position    :integer          default(1)
#

class Expert < ActiveRecord::Base
  validates :name, :avatar, presence: true

  default_scope { order('position') }
end
