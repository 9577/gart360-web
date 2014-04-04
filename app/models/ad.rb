# == Schema Information
#
# Table name: ads
#
#  id              :integer          not null, primary key
#  area            :string(255)
#  position        :integer          default(1)
#  type_identifier :string(255)
#  title           :string(255)
#  body            :text
#  image           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  url             :string(255)
#

class Ad < ActiveRecord::Base

  AREAS = [ :auction_slider ]

  validates :title, presence: true

  symbolize :area, in: AREAS, scopes: :shallow, methods: true

  symbolize :type_identifier, in: [ :photo, :text ], scopes: :shallow, methods: true, default: :photo

  def banner_url
    image << '?imageView2/1/w/740/h/262/format/jpg'
  end

end
