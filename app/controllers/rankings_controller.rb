class RankingsController < ApplicationController

  def index
    players = Player.includes(:position, :team).joins(:position).where('positions.key = ?', params[:position]).where.not(tier: nil).order(:tier, :tier_index)
    render json: players.to_json({:include => [:position, :team], :methods => :name}), status: 200
  end
end