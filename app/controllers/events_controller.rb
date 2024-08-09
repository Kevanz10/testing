# frozen_string_literal: true

class EventsController < ApplicationController
  # TODO: implement the event saving endpoint
  before_action :check_params, only: [:save]

  def save
    begin
      event = Event.new(event_params)
      event.timestamp = event.format_time(event_params[:timestamp])

      if event.save
        render json: { message: 'Event Saved' }, status: :ok
      else
        render json: { message: 'Failed to save event' }, status: :unprocessable_entity
      end
    rescue ArgumentError => e
      render json: { message: e.message }, status: :unprocessable_entity
    end
  end

  private

  def check_params
   return params_not_found_error unless params[:kind].present? && params[:timestamp].present? && params[:employee_id].present? 
  end

  def params_not_found_error
    render json: { error: 'Failed to save event' }, status: :unprocessable_entity
  end


  def event_params
    params.permit(:employee_id, :timestamp, :kind)
  end
end
