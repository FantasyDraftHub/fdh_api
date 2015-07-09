class FantasyTeamsController < ApplicationController
  before_action :authenticate

  def index
    fantasy_teams = FantasyTeam.where(fantasy_league_id: params['fantasy_league_id'])
    render json: fantasy_teams, status: 200
  end

  def show
    fantasy_team = FantasyTeam.where(id: params['id'], fantasy_league_id: params['fantasy_league_id']).first
    render json: fantasy_team, status: 200
  end

  def create
    fantasy_team = FantasyTeam.new(fantasy_team_params)
    fantasy_team.fantasy_league_id = params['fantasy_league_id']

    if fantasy_team.save
      render json: fantasy_team, status: 201
    else
      render json: fantasy_team.errors, status: 400
    end
  end

  def update
    fantasy_team = FantasyTeam.where(id: params['id'], fantasy_league_id: params['fantasy_league_id']).first
    if fantasy_team.update(fantasy_team_params)
      render json: fantasy_team, status: 201
    else
      render json: fantasy_team.errors, status: 400
    end
  end
  private
    def fantasy_team_params
      params.permit(:name, :owner, :active)
    end
end