# == Schema Information
#
# Table name: global_images
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  data        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  target_type :string(255)
#

class GlobalImage < ActiveRecord::Base

  mount_uploader :data, MainUploader

  validates :data, presence: true

  belongs_to :user

end
