class EventsController < ApplicationController

  def create
    @show = Show.find(params[:show_id])
    @event = @show.events.create(params[:event].permit(:start, :end, :content, :firework_id))
    @event.show_id = @show.id
    firework = Firework.find(:firework_id)
    @event.delay = firework.delay

    redirect_to edit_show_path(@show)
  
  end

def destroy
    @event = Event.find(params[:id])
    @show = Show.find(params[:show_id])
    if @event.destroy 
      flash[:notice] = 'Event removed'
      redirect_to edit_show_path(@show)
      else
        raise "Something went wrong in the Event Controller (destroy)"
    end
  end
end
