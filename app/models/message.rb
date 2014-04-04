# == Schema Information
#
# Table name: messages
#
#  id              :integer          not null, primary key
#  conversation_id :integer
#  user_id         :integer
#  body            :text
#  created_at      :datetime
#  updated_at      :datetime
#

class Message < ActiveRecord::Base

  validates :body, presence: true

  belongs_to :user
  belongs_to :conversation, counter_cache: true

  default_scope { order('created_at DESC') }

end
