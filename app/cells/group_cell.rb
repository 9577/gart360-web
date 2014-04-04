class GroupCell < Cell::Rails
  append_view_path 'app/views'

  include Devise::Controllers::Helpers

  helper ApplicationHelper
  helper Sns::GroupsHelper
  helper_method :current_user

  ## 最新热门小组
  def popular
    @groups = Group.all.sample(3)

    render
  end

  ## 最新创建的小组
  def latest
    @groups = Group.order('created_at DESC').limit(3)

    render
  end

  def active_users args
    group = args[:group]
    @users = group.members.sample(6)

    render
  end

  def rising_in_week
    @groups = Group.all.sample(5)

    render
  end

  def hot_topics
    @topics = current_user.topics.sample(5)

    render
  end

  def recommended
    @groups = Group.all.sample(3)

    render
  end

  def related args
    @group = args[:group]
    @groups = Group.all.sample(3)

    render
  end
end
