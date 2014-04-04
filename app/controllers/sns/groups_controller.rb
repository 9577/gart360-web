class Sns::GroupsController < ApplicationController
  inherit_resources

  main_nav_highlight :groups
  sec_nav_highlight :groups

  custom_actions collection: [ :explore, :all, :refresh_pop, :refresh_recommended]
  respond_to :js, only: [:refresh_pop, :refresh_recommended]

  before_filter :authenticate_user!, except: [ :index, :show ]

  def index
    @topics = Topic.includes(:group).page params[:page]
  end

  def show
    @group = Group.find params[:id]
    if params[:topics] == 'hot'
      @topics = @group.topics.hot.page params[:page]
    else
      @topics = @group.topics.latest.page params[:page]
    end
  end

  def create
    @group = end_of_association_chain.new group_params

    create! do |success, failure|
      success.html { redirect_to resource_path(resource) }
      failure.html {
        render :new
      }
    end
  end

  def all
    @groups = current_user.groups
    @joined_groups = current_user.joined_groups
    @sec_nav = :my
  end

  def overview
    @groups = current_user.groups
    @topics = current_user.topics.page params[:page]
    @joined_groups = current_user.joined_groups
    @sec_nav = :my
  end

  def replied_topics
    @topics = current_user.replied_topics.includes(:group).page params[:page]
    @sec_nav = :my
  end

  def published_topics
    @topics = current_user.topics.includes(:group).page params[:page]
    @sec_nav = :my
  end

  def explore
    @sec_nav = :explore
    @groups = Group.all.page params[:page]
  end

  def members
    @members = resource.joined_members.page params[:page]
  end

  def pending_members
    @group = Group.find(params[:id])
    @members = @group.pending_members.page params[:page]
  end

  protected

  def group_params
    params.require(:group).permit!
  end

  def begin_of_association_chain
    current_user
  end
end
