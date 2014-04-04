class Sns::HomeController < ApplicationController

  before_filter :authenticate_user!

  def index
    @main_nav = @sec_nav = :home
    owner_ids = current_user.followed_users.pluck(:id) << current_user.id
    @activities = PublicActivity::Activity.order("created_at desc").
      where(owner_id: owner_ids, owner_type: "User").page(params[:page]).per(10)
  end

  def guang
    @main_nav = :home
    @sec_nav = :guang
  end
  
end
