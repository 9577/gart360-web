# == Schema Information
#
# Table name: daily_items
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  description    :text
#  price          :decimal(20, 2)   default(0.0)
#  start_at       :date
#  created_at     :datetime
#  updated_at     :datetime
#  photos_count   :integer          default(0)
#  inviters_count :integer          default(0)
#

class DailyItem < ActiveRecord::Base

  attr_readonly :photos_count, :inviters_count

  validates :title, :description, :price, :start_at, presence: true

  has_many :photos, class_name: 'DailyItemPhoto'
  has_many :inviters, class_name: 'DailyItemInviter'

  accepts_nested_attributes_for :photos

  def self.current_item
    daily_item = DailyItem.where('start_at >= ? and start_at < ?', Date.today, Date.today.in(1.day)).first
    Time.now .hour >= 12 ? daily_item : nil
  end
end
