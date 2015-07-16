class PlayersController < ApplicationController

  def index
    players = Player.where(league_id: params['league_id'])
    render json: players.to_json({:include => [:position]}), status: 200
  end

  def show
    player = Player.where(league_id: params['league_id'], id: params['id']).first
    render json: player, status: 200
  end

  def create
    player = Player.new(player_params)
    player.league_id = params['league_id']

    if player.save
      render json: player, status: 201
    else
      render json: player.errors, status: 400
    end
  end

  def update
    player = Player.where(league_id: params['league_id'], id: params['id']).first
    if player.update(player_params)
      render json: player, status: 201
    else
      render json: player.errors, status: 400
    end
  end
  private
    def player_params
      params.permit(:team_id, :position_id, :first_name, :last_name, :season, :active)
    end
end