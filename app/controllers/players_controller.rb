class PlayersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin, only: [:new, :create, :edit, :update, :destroy]

  def index
    @players = Player.includes(:stats, :matches)
  end  

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to players_path, notice: "Player created successfully."
    else
      render :new
    end
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    if @player.update(player_params)
      redirect_to players_path, notice: "Player updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @player = Player.find(params[:id])
    if @player.destroy
      redirect_to players_path, notice: "Player deleted."
    else
      redirect_to players_path, alert: "Unable to delete player."
    end
  end

  private

  def player_params
    params.require(:player).permit(:first_name, :last_name, :email)
  end

  def check_admin
    unless current_user.admin?
      redirect_to root_path, alert: "You are not authorized to manage players."
    end
  end
end
