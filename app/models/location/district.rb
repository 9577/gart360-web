# == Schema Information
#
# Table name: districts
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  city_id     :integer
#  pinyin      :string(255)
#  pinyin_abbr :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class District < ActiveRecord::Base

  belongs_to :city
  has_one :province, through: :city

  def short_name
    @short_name ||= name.gsub(/区|县|市|自治县/,'')
  end

  def brothers
    @brothers ||= District.where("city_id = #{city_id}")
  end

end
