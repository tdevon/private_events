class EventsController < ApplicationController
    def index
        @events = Event.all
    end
    def show
        @event = Event.find_by(id: params[:id])
        @attendees = @event.attendees
        @date = @event.start_date.strftime("%B %d, %Y")
    end
    def new
        @event = current_user.events.new
    end
    def create
        @event = current_user.events.build(title: params[:event][:title])
        datetime = DateTime.civil(params[:start_date][:year].to_i, params[:start_date][:month].to_i, params[:start_date][:day].to_i,
        params[:start_date][:hours].to_i,params[:start_date][:minutes].to_i, params[:start_date][:seconds].to_i)
        @event.start_date = datetime
        if @event.save
            flash[:success] = "Event created!"
            redirect_to current_user
        else
            flash[:danger] = "Event not created."
            render 'new'
        end
    end
    def signup
        @event = Event.find_by(id: params[:id])
        current_user.attending_events << @event
        redirect_to @event
    end
end
