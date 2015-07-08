class LeaguesController < ApplicationController

  def index
    leagues = League.all
    render json: leagues, status: 200
  end

  def show
    league = League.find_by_id(params['id'])
    render json: league, status: 200
  end

  def create
    league = League.new(league_params)
    if league.save
      render json: league, status: 201
    else
      render json: league.errors, status: 400
    end
  end

  def update
    league = League.find_by_id(params['id'])
    if league.update(league_params)
      render json: league, status: 201
    else
      render json: league.errors, status: 400
    end
  end

  def league_params
    params.permit(:name, :key)
  end
end