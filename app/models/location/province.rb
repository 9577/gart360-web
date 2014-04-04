# == Schema Information
#
# Table name: provinces
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  pinyin      :string(255)
#  pinyin_abbr :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Province < ActiveRecord::Base
  has_many :cities, dependent: :destroy
  has_many :districts, through: :cities
end
