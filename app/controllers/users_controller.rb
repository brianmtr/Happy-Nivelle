class UsersController < ApplicationController
  def index
      @users = User.all
    end

  def role
      @user = User.find(params[:id])
      @user.role = 'admin'
      @user.save
      redirect_to '/users', notice: "l'évenement a bien été accepté."
  end
  def event_params
      params.require(:event).permit(:title, :date, :hour, :adress, :description, :image, :id)
    end
end
