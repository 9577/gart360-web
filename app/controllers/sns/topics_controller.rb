class Sns::TopicsController < ApplicationController
  inherit_resources
  include Sns::GroupsHelper
  belongs_to :group

  before_filter :authenticate_user!, except: [ :show, :index ]

  def show
    @relation = parent.related_with current_user
    @replies = resource.replies.includes(:user, :quote)
    show!
  end

  def create
    @topic = end_of_association_chain.new topic_params
    @topic.user = current_user

    create! do |success, failure|
      success.html { redirect_to resource_path }
      failure.html { render :new }
    end
  end

  def destroy
    destroy! { sns_groups_path }
  end

  protected

  def topic_params
    params.require(:topic).permit!
  end
end
