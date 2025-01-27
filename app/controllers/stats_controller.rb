class StatsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin
  before_action :set_player
  before_action :set_stat, only: [:edit, :update, :destroy]

  def index
    @stats = @player.stats.includes(:match)
    @matches = Match.all
  end

  def new
    @stat = @player.stats.build
  end

  def create
    @stat = @player.stats.build(stat_params)
      
    if @stat.save
      redirect_to player_stats_path(@player), notice: 'Stat created successfully.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @stat.update(stat_params)
      redirect_to player_stats_path, notice: "Stat updated successfully."
    else
      render :edit
    end
  end
  
  def destroy
    @stat.destroy
    redirect_to player_stats_path(@player), notice: "Stat was successfully deleted."
  end

  private

  def set_player
    @player = Player.find(params[:player_id])
  end

  def set_stat
    @stat = @player.stats.find_by(id: params[:id])
    # redirect_to player_path(@player), alert: "Stat not found." unless @stat
  end

  def stat_params
    params.require(:stat).permit(:goals, :assists, :rating, :present, :match_id)
  end

  def check_admin
    unless current_user.admin?
      redirect_to root_path, alert: "You are not authorized to edit stats."
    end
  end
end
