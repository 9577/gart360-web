# == Schema Information
#
# Table name: cities
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  province_id :integer
#  level       :integer
#  zip_code    :string(255)
#  pinyin      :string(255)
#  pinyin_abbr :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class City < ActiveRecord::Base

  belongs_to :province
  has_many :districts, dependent: :destroy

  def short_name
    @short_name ||= name.gsub(/市|自治州|地区|特别行政区/,'')
  end

  def brothers
    @brothers ||= City.where("province_id = #{province_id}")
  end

end
