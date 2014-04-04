# == Schema Information
#
# Table name: replies
#
#  id         :integer          not null, primary key
#  topic_id   :integer
#  body       :text
#  quote_id   :integer
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class Reply < ActiveRecord::Base

  validates :body, presence: true

  belongs_to :topic, counter_cache: true
  belongs_to :user, counter_cache: true

  belongs_to :quote, class_name: 'Reply'
end
