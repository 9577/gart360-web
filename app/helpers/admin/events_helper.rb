module Admin::EventsHelper

  def render_period(event)
    "时间：#{ event.start_at.to_date } 至 #{ event.end_at.to_date }"
  end

end
