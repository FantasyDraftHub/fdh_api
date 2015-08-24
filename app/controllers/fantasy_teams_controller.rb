class FantasyTeamsController < ApplicationController
  before_action :authenticate

  def index
    fantasy_teams = FantasyTeam.where(fantasy_draft_id: params['fantasy_draft_id'])
    render json: fantasy_teams, status: 200
  end

  def show
    fantasy_team = FantasyTeam.where(id: params['id'], fantasy_draft_id: params['fantasy_draft_id']).first
    render json: fantasy_team, status: 200
  end

  def create
    fantasy_draft = FantasyDraft.find_by(id: params['fantasy_draft_id'])
    fantasy_team = fantasy_draft.fantasy_teams.new(fantasy_team_params)
    fantasy_team.draft_order = fantasy_draft.fantasy_teams.count

    if fantasy_team.save
      if fantasy_team.draft_order == 0
        fantasy_draft.update_attributes(fantasy_team_id: fantasy_team.id)
      end
      render json: fantasy_team, status: 201
    else
      render json: fantasy_team.errors, status: 400
    end
  end

  def update
    fantasy_team = FantasyTeam.where(id: params['id'], fantasy_draft_id: params['fantasy_draft_id']).first
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