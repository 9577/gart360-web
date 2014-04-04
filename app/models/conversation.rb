# == Schema Information
#
# Table name: conversations
#
#  id              :integer          not null, primary key
#  sender_id       :integer
#  recipient_id    :integer
#  is_read         :boolean          default(FALSE)
#  is_archived     :boolean          default(FALSE)
#  created_at      :datetime
#  updated_at      :datetime
#  messages_count  :integer          default(0)
#  type_identifier :string(255)
#

class Conversation < ActiveRecord::Base

  attr_readonly :messages_count

  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'

  has_many :messages, dependent: :destroy

  symbolize :type_identifier, in: [ :personal, :system ], scopes: :shallow, methods: true, default: :personal

  accepts_nested_attributes_for :messages, reject_if: :all_blank

  def first_message
    messages.first
  end

end
