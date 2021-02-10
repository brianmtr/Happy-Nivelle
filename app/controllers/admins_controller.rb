class AdminsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]

  # GET /events or /events.json
def index
  @events = Event.all
  @homes = Home.all
  @users = User.all
end

# GET /events/1 or /events/1.json
def show
end

# GET /events/new
def new
  @event = Event.new
end

# GET /events/1/edit
def edit
end

# POST /events or /events.json
def create
  @event = Event.new(event_params)

  respond_to do |format|
    if @event.save
      format.html { redirect_to @event, notice: "l'évenement est en attente de validation." }
      format.json { render :show, status: :created, location: @event }
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @event.errors, status: :unprocessable_entity }
    end
  end
end

# PATCH/PUT /events/1 or /events/1.json
def update
  respond_to do |format|
    if @event.update(event_params)
      format.html { redirect_to @event, notice: "l'évenement a bien été modifié." }
      format.json { render :show, status: :ok, location: @event }
    else
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @event.errors, status: :unprocessable_entity }
    end
  end
end

def role
  @user = User.find(params[:id])
  @user.role = 'admin'
  @user.save
  redirect_to '/users/index', notice: "l'évenement a bien été accepté."
end

def accepted
  @home = Home.find(params[:id])
  @home.accepted = true
  @home.save
  redirect_to '/admins/index', notice: "l'évenement a bien été accepté."

end


def accept
  @event = Event.find(params[:id])
  @event.accept = true
  @event.save
  redirect_to '/admins/index', notice: "l'évenement a bien été accepté."
end

def denied
  @event = Event.find(params[:id])
  @event.denied = true
  @event.save
  redirect_to events_url, notice: "l'évenement a bien été refusé."
end

def destroy
  @event.destroy
  respond_to do |format|
    format.html { redirect_to events_url, notice: "l'évenement a bien été supprimé." }
    format.json { head :no_content }
  end
end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.

end
