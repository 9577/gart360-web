module ApplicationHelper

  def favourite_link_to(target, html_options={})
    html_options[:class] = 'btn btn-sm btn-default btn-favourite'

    if target.liked_by?(current_user)
      html_options[:class] << ' btn-active'
      url = unlike_target_path(target_id: target.id, target_type: target.class.name)

      label = '已喜欢'
    else
      url = like_target_path(target_id: target.id, target_type: target.class.name)
      label = '喜欢'
    end

    label = "<i class=\"fa fa-heart\"></i>" + label + " (<span class=\"num\">#{target.fans_count}</span>)"

    link_to label.html_safe, url, method: :post, remote: true, class: html_options[:class], data: { type: :json }
  end

  def follow_link_to(target, html_options={})
    html_options[:class] = 'btn btn-xs btn-primary btn-follow'

    if target.followed_by?(current_user)
      html_options[:class] << ' btn-active'
      url = unfollow_target_path(target_id: target.id, target_type: target.class.name)

      label = '已关注'
    else
      url = follow_target_path(target_id: target.id, target_type: target.class.name)
      label = '关注'
    end

    link_to label.html_safe, url, method: :post, remote: true, class: html_options[:class], data: { type: :json }
  end

  def profile_link_to(text, url_options = {}, html_options = {})
    if current_page?(url_options)
      html_options[:class] = '' if html_options[:class].nil?
      html_options[:class] += ' active'
    end

    link_to(text, url_options, html_options)
  end

  def filter_by_category_link_to(text, url_options = {}, html_options = {})
    if params[:filter_by_category] == html_options[:'data-category'].to_s
      html_options[:class] = '' if html_options[:class].nil?
      html_options[:class] += ' active'
    end

    link_to(text, url_options, html_options)
  end

  def filter_by_state_link_to(text, url_options = {}, html_options = {})
    if params[:filter_by_state] == html_options[:'data-state']
      html_options[:class] = '' if html_options[:class].nil?
      html_options[:class] += ' active'
    end

    link_to(text, url_options, html_options)
  end

  def main_nav(name, options = {}, &block)
   if @main_nav == name
     if options[:class]
       options[:class] += ' active'
     else
       options[:class] = 'active'
     end
   end
   content = capture(&block)
   content_tag(:li, content, options)
  end

  def sec_nav(name, options = {}, &block)
    if @sec_nav == name
      if options[:class]
        options[:class] += ' active'
      else
        options[:class] = 'active'
      end
    end
    content = capture(&block)
    content_tag(:li, content, options)
  end

  def label_class(state)
    case state
    when :pending
      'label label-warning'
    when :published
      'label label-info'
    when :finished
      'label label-default'
    end
  end

  def user_profile_url(user)
    if current_user == user
      my_profile_path
    else
      user_path(user)
    end
  end

  def start_conversation_url(recipient)
    if current_user.conversation(recipient)
      conversation_path(recipient_id: recipient.id)
    else
      new_conversation_path(recipient_id: recipient.id)
    end
  end

  def render_user_avatar(user, options={})

    if options.key?(:size)
      width, height = options[:size].split('x')
    else
      width, height = 176, 176
    end

    html_classes = 'userpic'
    html_classes << ' fl' if options.key?(:fl)

    link_to user_profile_url(user), class: html_classes, title: user.username do
      image_tag user.avatar_url(width, height), alt: user.username
    end
  end

  def render_group_logo(group)
    link_to sns_group_path, title: group.name, class: 'g-pic' do
      image_tag group.logo_url, alt: group.name
    end
  end

  def render_username(user)
    link_to user.username, user_profile_url(user), title: user.username, class: 'username'
  end

  def time_left(time, string)
    time_left = (time - Time.zone.now).to_i
    if time_left > 0
      hours = time_left / 1.hour
      mins = (time_left - hours.hours) / 1.minute
      seconds = (time_left - hours.hours - mins.minutes) / 1
    else
      return string
    end
    "#{hours}小时 #{mins}分 #{seconds}秒"
  end

  def cut_array(arr)
    new_arr = []
    arr.each_with_index{ |a, index| new_arr << [a, arr[index + 1]] if index % 2 == 0 }
    new_arr
  end

  def state_for_progress(array, state)
    array.index(state).to_f / (array.size - 1) * 100
  end

  def address_class(address, index)
    class_name = ''
    class_name = class_name + 'hide ' if index > 3
    class_name = class_name + 'active-item ' if address.is_default
    class_name
  end

  def daily_item_price(price)
    str = '<em>你只需</em>'
    price.to_s.rjust(4, '0').each_char do |char|
      str << "<span>#{char}</span>"
    end
    str << '<em>元购买</em>'
    str
  end
end
