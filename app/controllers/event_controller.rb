class EventController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

def index
  @events = current_user.events
end

def show; end

def new
  @event = current_user.events.build
end

def create
  @event = current_user.events.build(event_params)

  if @event.save
    redirect_to @event, notice: "Event created"
  else
    render :new
  end
end

def edit; end

def update
  if @event.update(event_params)
    redirect_to @event, notice: "Event updated"
  else
    render :edit
  end

end
