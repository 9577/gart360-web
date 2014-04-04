module Sns::GroupsHelper
  def group_status user, group
    if user.blank?
      link_to '+加入', sns_group_group_users_path(group), method: 'post', class: 'btn btn-primary btn-sm'
    else
      if user.joined_groups.include? group
        link_to '已加入', 'javascript:void(0)', class: 'btn btn-default btn-sm'
      elsif user.pending_groups.include? group
        link_to '等待批准', cancel_sns_group_group_users_path(group), method: 'delete', remote: true, class: 'btn btn-default btn-sm', data: {confirm: '取消申请？'}
      else
        link_to '+加入', sns_group_group_users_path(group), method: 'post', remote: true, class: 'btn btn-primary btn-sm'
      end
    end
  end

  def group_from_username user, group
    if group.user_id = user.id
      '我是组长'
    else
      group.user.username
    end
  end
end
