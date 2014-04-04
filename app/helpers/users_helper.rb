module UsersHelper
  def follow_status target
    if target.followed_by? current_user
      link_to '已关注', 'javascript:void(0)', class: 'btn btn-default btn-sm'
    else
      link_to '+关注', follow_target_path(target_id: target.id, target_type: target.class.name), method: :post, remote: true, class: 'btn btn-primary btn-sm', id: "follow_#{target.id}"
    end
  end
end