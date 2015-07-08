class PositionsController < ApplicationController

  def index
    positions = Position.where(league_id: params['league_id'])
    render json: positions, status: 200
  end

  def show
    position = Position.where(league_id: params['league_id'], id: params['id']).first
    render json: position, status: 200
  end
end