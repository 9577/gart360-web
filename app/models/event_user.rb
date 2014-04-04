# == Schema Information
#
# Table name: event_users
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class EventUser < ActiveRecord::Base

  belongs_to :event, counter_cache: :users_count
  belongs_to :user, counter_cache: :joined_events_count

end
