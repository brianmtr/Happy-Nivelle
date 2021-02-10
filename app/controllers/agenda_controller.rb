class AgendaController < ApplicationController
  def index
    @events = Event.all
  end
  def accept
    @event = Event.find(params[:id])
    @event.accept = true
    @event.save
    redirect_to events_url, notice: "l'évenement a bien été accepté."
  end
end