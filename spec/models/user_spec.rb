# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  legacy_password_hash   :string(255)
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  username               :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  conversations_count    :integer          default(0)
#  addresses_count        :integer          default(0)
#  orders_count           :integer          default(0)
#  events_count           :integer          default(0)
#  galleries_count        :integer          default(0)
#  followers_count        :integer          default(0)
#  birthdate              :date
#  bio                    :text
#  avatar                 :string(255)
#  city_id                :integer
#  gender                 :string(255)
#  is_profile_completed   :boolean          default(FALSE)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  statuses_count         :integer          default(0)
#  province_id            :integer
#  topics_count           :integer          default(0)
#  replies_count          :integer          default(0)
#  joined_events_count    :integer          default(0)
#  artworks_count         :integer          default(0)
#  collection_items_count :integer          default(0)
#  mobile_phone           :string(255)
#

require 'spec_helper'

describe User do
  pending "add some examples to (or delete) #{__FILE__}"
end
