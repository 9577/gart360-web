module UserMessage
  extend ActiveSupport::Concern

  included do
    has_many :outbox_conversations, class_name: 'Conversation', foreign_key: 'sender_id'
    has_many :inbox_conversations, class_name: 'Conversation', foreign_key: 'recipient_id'

    has_many :inbox_messages, class_name: 'Message', foreign_key: 'recipient_id'

    after_create :create_system_conversations
  end

  def conversations
    Conversation.where('conversations.sender_id = :owner_id OR conversations.recipient_id = :owner_id AND messages_count > 0', owner_id: id)
  end

  def unread_conversations
    conversations.joins(:messages).where('messages.is_read = ?', false)
  end

  def unread_messages
    inbox_messages.unread.count
  end

  def system_conversation
    conversation = inbox_conversations.system.first

    return nil if conversation.messages_count.zero?
  end

  ## 用户创建后自动创建系统conversation.
  def create_system_conversations
    conversation = inbox_conversations.new
    conversation.type_identifier = :system
    conversation.save
  end
  
  ## 系统消息接收
  def receive_post_message!(body)
    conversation = inbox_conversations.system.first
    conversation.messages.create!(
      recipient_id: id,
      body: body
    ) if conversation
  end

  def conversation(user)
    inbox_conversation(user) || outbox_conversation(user)
  end

  def inbox_conversation(user)
    inbox_conversations.find_by_sender_id(user.id)
  end

  def outbox_conversation(user)
    outbox_conversations.find_by_recipient_id(user.id)
  end

end