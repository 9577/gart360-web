class SidebarCell < Cell::Rails
  append_view_path 'app/views'

  include Devise::Controllers::Helpers

  helper ApplicationHelper

  helper_method :current_user
  
  def hot_users
    render
  end

  def following
    @following = current_user.followed_users.limit(3)
    render 
  end

end
