# == Schema Information
#
# Table name: leaderboards
#
#  id              :integer          not null, primary key
#  target_id       :integer
#  target_type     :string(255)
#  type_identifier :string(255)
#  position        :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class Leaderboard < ActiveRecord::Base

  TYPE_IDENTIFIERS = [ :featured_groups ]


  belongs_to :target, polymorphic: true

  symbolize :type_identifier, in: TYPE_IDENTIFIERS, scopes: :shallow, methods: true

end
