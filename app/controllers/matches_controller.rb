class MatchesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

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

  private

  def match_params
    params.require(:match).permit(:date, :location)
  end

  def check_admin
    unless current_user.admin?
      redirect_to root_path, alert: "You are not authorized to create matches."
    end
  end
end
