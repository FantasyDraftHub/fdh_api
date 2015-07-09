class FantasyLeaguesController < ApplicationController
  before_action :authenticate

  def index
    fantasy_leagues = current_user.fantasy_leagues.all
    render json: fantasy_leagues, status: 200
  end

  def show
    fantasy_league = current_user.fantasy_leagues.find_by_id(params['id'])
    render json: fantasy_league, status: 200
  end

  def create
    fantasy_league = current_user.fantasy_leagues.new(fantasy_league_params)
    fantasy_league.league_id = League.find_by_key('NFL').id

    if fantasy_league.save
      render json: fantasy_league, status: 201
    else
      render json: fantasy_league.errors, status: 400
    end
  end

  def update
    fantasy_league = FantasyLeague.where(id: params['id']).first
    if fantasy_league.update(fantasy_league_params)
      render json: fantasy_league, status: 201
    else
      render json: fantasy_league.errors, status: 400
    end
  end
  private
    def fantasy_league_params
      params.permit(:name)
    end
end