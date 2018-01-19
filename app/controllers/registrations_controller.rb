class RegistrationsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_event

  def create
    @registration = current_user.registrations.create(registration_params.merge({
     event: @event }))

    redirect_to @registration.event, notice: "Thank you for booking!"
  end

  private

  def registration_params
    params.require(:registration).permit(:status, :guests_count)
  end

  def load_event
    @event = Event.find(params[:event_id])
  end
end
