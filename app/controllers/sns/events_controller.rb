class Sns::EventsController < ApplicationController
  inherit_resources

  main_nav_highlight :events

  custom_actions collection: :overview

  before_filter :authenticate_user!

  def index
    @sec_nav = :all
  end

  def overview
    @sec_nav = :overview
    @active_events = Event.active.limit(3)
  end

  def my
    @sec_nav = :my
    @events = current_user.events
  end

  def create
    @event = end_of_association_chain.new event_params
    @event.user = current_user
    create! do |success, failure|
      success.html { redirect_to sns_event_path(@event)}
      failure.html { render :new }
    end
  end

  def update
    @event = Event.find params[:id]
    update! do |success, failure|
      success.html { redirect_to sns_event_path(@event)}
      failure.html { render :edit }
    end
  end

private
  def event_params
    if params[:event][:start_at].present? && params[:event][:end_at].present?
      start_at = DateTime.strptime params[:event].delete('start_at'), '%m/%d/%Y'
      end_at   = DateTime.strptime params[:event].delete('end_at'), '%m/%d/%Y'
      params[:event].merge!(start_at: start_at, end_at: end_at)
    end
    params.require(:event).permit!
  end
end
