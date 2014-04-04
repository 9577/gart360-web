class EventCell < Cell::Rails
  append_view_path 'app/views'

  include Devise::Controllers::Helpers

  helper ApplicationHelper
  helper_method :current_user

  def active_for_overview
    @events = Event.active.limit(3)
    
    render
  end

  def pending_for_overview
    @events = Event.pending.limit(3)

    render
  end

  def closed_for_overview
    @events = Event.closed.limit(2)

    render
  end

end
