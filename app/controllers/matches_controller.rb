class MatchesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin
  before_action :set_match, only: [:edit, :update, :destroy]

  def index
    @matches = Match.all
  end
  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)
    if @match.save
      redirect_to players_path, notice: "Match created successfully."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @match.update(match_params)
      redirect_to matches_path, notice: "Match updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @match.destroy
    redirect_to matches_path, notice: "Match deleted successfully."
  end

  private

  def match_params
    params.require(:match).permit(:date, :location)
  end

  def check_admin
    unless current_user.admin?
      redirect_to root_path, alert: "You are not authorized to create matches."
    end
  end

  def set_match
    @match = Match.find(params[:id])
  end
end
