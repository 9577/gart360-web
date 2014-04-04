# == Schema Information
#
# Table name: right_certificates
#
#  id         :integer          not null, primary key
#  right_id   :integer
#  image      :string(255)
#  position   :integer          default(1)
#  created_at :datetime
#  updated_at :datetime
#

class RightCertificate < ActiveRecord::Base

  belongs_to :right, counter_cache: :certificates_count

  default_scope { order(:position) }

end
