class TeamsController < ApplicationController

  def index
    teams = Team.where(league_id: params['league_id'])
    render json: teams, status: 200
  end

  def show
    team = Team.where(league_id: params['league_id'], id: params['id']).first
    render json: team, status: 200
  end
end