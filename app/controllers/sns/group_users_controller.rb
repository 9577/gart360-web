class Sns::GroupUsersController < ApplicationController
  before_filter :authenticate_user!

  def create
    @group = Group.find params[:group_id]
    @group_user = current_user.join_group @group
    @topic = @group.topics.find params[:topic_id] if params[:topic_id]
    respond_to do |format|
      format.js
      format.html {redirect_to sns_group_topic_path(@group, @topic)}
    end
  end

  def approve
    @group_user = GroupUser.find_by(group_id: params[:group_id], user_id: params[:user_id])
    @group_user.update_attribute(:is_confirmed, true) if @group_user
  end

  def reject
    @group_user = GroupUser.find_by(group_id: params[:group_id], user_id: params[:user_id])
    @group_user.destroy if @group_user
    redirect_to pending_members_sns_group_path(@group_user.group)
  end

  def cancel
    @group = Group.find params[:group_id]
    @group_user = current_user.pending_group_users.where(group_id: params[:group_id]).first if @group
    @group_user.destroy if @group_user
  end

private
  def group_user_params
    params.require(:group_user).permit!
  end
end
