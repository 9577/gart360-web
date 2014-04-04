class Sns::RepliesController < ApplicationController
  def create
    @reply = current_user.replies.create reply_params
    redirect_to sns_group_topic_path(@reply.topic.group, @reply.topic)
  end

  def destroy
    @reply = Reply.find params[:id]
    @reply.destroy if @reply
    redirect_to sns_group_topic_path(@reply.topic.group, @reply.topic)
  end

private
  def reply_params
    params.require(:reply).permit!
  end
end
