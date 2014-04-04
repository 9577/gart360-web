class UsersController < ApplicationController
  inherit_resources
  before_action :authenticate_user!
  
  RESOURCE_ACTIONS = [ :followers, :following, :follow, :unfollow, :like, :unlike, :status, :likes, :favourites ]

  custom_actions resource: RESOURCE_ACTIONS

  def show
    @main_nav, @sec_nav = :home, :profile

    @artworks = resource.artworks.limit(3)
    @liked_artworks = resource.liked_artworks.limit(3)

    show!
  end

  ## 我的说说
  def status
    @main_nav, @sec_nav = :home, :profile
    @statuses = resource.statuses
  end

  ## 我的喜欢
  def likes
    @main_nav, @sec_nav = :home, :profile
    if params.key?(:order)
      @q = current_user.likes.order('created_at desc').search(params[:q])
    else
      @q = current_user.likes.order('updated_at asc').search(params[:q])
    end
    @likes = @q.result(distinct: true).page(params[:page])
  end

  ## 我的收藏
  def favourites
    @main_nav, @sec_nav = :home, :profile
  end

  ## 我的廊
  def galleries
    @main_nav = :galleries
    @sec_nav = :my
    @galleries = resource.galleries
  end

  def followers
    @followers = resource.followers
  end

  def following
    @following = resource.followed_users
  end

  # user actions
  def follow
    @target = target
    current_user.follow!(@target)

    @target.reload

    respond_to do |format|
      format.js {
        render json: {
          url: unfollow_target_path(target_id: @target.id, target_type: @target.class.name),
          followers_count: @target.followers_count
        }
      }
    end
  end

  def unfollow
    @target = target
    current_user.unfollow!(@target)

    @target.reload

    respond_to do |format|
      format.js {
        render json: {
          url: follow_target_path(target_id: @target.id, target_type: @target.class.name),
          followers_count: @target.followers_count
        }
      }
    end
  end

  def like
    @target = target
    current_user.like! @target

    @target.reload

    respond_to do |format|
      format.js {
        render json: {
          url: unlike_target_path(target_id: @target.id, target_type: @target.class.name),
          fans_count: @target.fans_count
        }
      }
    end
  end

  def unlike
    @target = target
    current_user.unlike! @target

    @target.reload

    respond_to do |format|
      format.js {
        render json: {
          url: like_target_path(target_id: @target.id, target_type: @target.class.name),
          fans_count: @target.fans_count
        }
      }
    end
  end

  protected

  def resource
    if params.key?(:id)
      super
    else
      current_user
    end
  end

  def target
    params[:target_type].constantize.find(params[:target_id]) unless params[:target_type].nil?
  end
end
