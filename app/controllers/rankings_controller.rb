class RankingsController < ApplicationController

  def index
    players = Player.includes(:position, :team).where.not(tier: nil)
    render json: players.to_json({:include => [:position, :team], :methods => :name}), status: 200
  end
end