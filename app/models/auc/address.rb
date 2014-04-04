# == Schema Information
#
# Table name: addresses
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  district_id :integer
#  body        :string(255)
#  recipient   :string(255)
#  is_default  :boolean          default(FALSE)
#  created_at  :datetime
#  updated_at  :datetime
#

class Address < ActiveRecord::Base
  attr_accessor :province_id, :city_id

  belongs_to :user
  belongs_to :district

  validates :city_id, :district_id, :body, :recipient, presence: true
  scope :default, ->{ where(is_default: true) }

  default_scope { order('is_default desc') }

  before_create :set_is_default

  def set_is_default
    user.addresses.default.where('id is not null').update_all(is_default: false) if is_default
  end

  def province_id
    return nil if new_record?
    city.province_id
  end

  def province
    return nil if new_record?
    city.province
  end

  def city
    return nil if new_record?
    district.city
  end

end
