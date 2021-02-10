class AdminsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]

  def index
    @events = Event.all
    @homes = Home.all
    @users = User.all
  end

  def accepted
    @home = Home.find(params[:id])
    @home.accepted = true
    @home.save
    redirect_to '/admins/index', notice: "l'évenement a bien été accepté."
  
  end

  def accept
    @event = Event.find(params[:id])
    if @event.accept = true
    @event.save
    redirect_to '/admins/index', notice: "l'évenement a bien été accepté."
    elsif @event.denied = true
      @event.save
    redirect_to '/admins/index', notice: "l'évenement a bien été accepté."
    end
  end

  def denied
    @event = Event.find(params[:id])
    @event.denied = true
    @event.save
    redirect_to events_url, notice: "l'évenement a bien été refusé."
  end



  private



  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :date, :hour, :adress, :description, :image, :id, :accept, :denied)
  end


end
