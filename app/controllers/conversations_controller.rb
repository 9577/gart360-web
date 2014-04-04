class ConversationsController < SnsBaseController
  inherit_resources

  before_filter :authenticate_user!

  def new
    if params.key?(:recipient_id)
      @recipient = User.find_by_id(params[:recipient_id])
      new!
    else
      @recipients = current_user.followed_users
    end
  end

  def create
    @converation = current_user.outbox_conversations.new conversation_params

    create! do |success, failure|
      success.html { redirect_to resource_path(resource) }
      failure.html { render :new }
    end
  end

  def show
    @messages = resource.messages
    @message = @messages.new

    if current_user = resource.sender
      @user = resource.sender
    else
      @user = resource.recipient
    end
    
    show!
  end

  protected

  def collection
    @conversations = current_user.conversations.where('messages_count > 0')
  end

  def conversation_params
    params.require(:conversation).permit!
  end
end
