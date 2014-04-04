class UserCell < Cell::Rails
  append_view_path 'app/views'

  include Devise::Controllers::Helpers

  helper ApplicationHelper
  helper UsersHelper
  helper_method :current_user

  def widget(args)
    @user = args[:user]

    render
  end

  def social_widget(args)
    @user = args[:user]

    render
  end

  def following(args)
    @user = args[:user]

    @following = @user.followed_users.limit(3)

    render
  end

  def popular_in_week
    @users = User.all.sample(3)

    render
  end

  def interested_users
    @users = User.all.sample(3)

    render
  end

end
