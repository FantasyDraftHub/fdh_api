class RankingsController < ApplicationController

  def index
    players = Player.includes(:position, :team, :fantasy_draft_pick).joins(:position).where('positions.key = ?', params[:position]).where.not(tier: nil).order(:tier, :tier_index)
    render json: players.to_json({:include => [:position, :team], methods: [:name, :has_been_drafted]}), status: 200
  end
end