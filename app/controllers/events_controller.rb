class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end
  
  def index
    @events = Event.all
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      flash[:success] = "Event created"
      redirect_to root_url
  end
end

private
  def event_params
    params.require(:event).permit(:name, :description, :place, :time)
  end
end