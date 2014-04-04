class MessagesController < SnsBaseController
  inherit_resources

  optional_belongs_to :conversation

  def create
    @message = end_of_association_chain.new(message_params)
    @message.user_id = current_user.id

    create! { conversation_path(parent) }
  end

  protected

  def message_params
    params.require(:message).permit!
  end
end
