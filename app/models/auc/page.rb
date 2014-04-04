# == Schema Information
#
# Table name: pages
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  code            :string(255)
#  body            :text
#  type_identifier :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  position        :integer
#  area            :string(255)
#

class Page < ActiveRecord::Base

  TYPE_IDENTIFIERS = [
    :auction_rule,
    :help_center,
    :payment,
    :auction_management,
    :user_guide
  ]

  AREAS = [ :auction_home, :footer ]

  validates :name, :code, :body, presence: true
  validates :code, uniqueness: true

  symbolize :type_identifier, in: TYPE_IDENTIFIERS, scopes: :shallow, methods: true
  symbolize :area, in: AREAS, copes: :shallow, methods: true

end
