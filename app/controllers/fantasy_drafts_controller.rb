class FantasyDraftsController < ApplicationController
  before_action :authenticate

  def index
    fantasy_drafts = FantasyDraft.where(fantasy_league_id: params['fantasy_league_id'])
    render json: fantasy_drafts, status: 200
  end

  def show
    fantasy_draft = FantasyDraft.where(id: params['id'], fantasy_league_id: params['fantasy_league_id']).first
    render json: fantasy_draft, status: 200
  end

  def create
    fantasy_draft = FantasyDraft.new(fantasy_draft_params)
    fantasy_draft.fantasy_league_id = params['fantasy_league_id']

    if fantasy_draft.save
      render json: fantasy_draft, status: 201
    else
      render json: fantasy_draft.errors, status: 400
    end
  end

  def update
    fantasy_draft = FantasyDraft.where(id: params['id'], fantasy_league_id: params['fantasy_league_id']).first
    if fantasy_draft.update(fantasy_draft_params)
      render json: fantasy_draft, status: 201
    else
      render json: fantasy_draft.errors, status: 400
    end
  end

  private
    def fantasy_draft_params
      params.permit(:fantasy_draft_style_id, :max, :rounds, :password, :subdomain, :starts_at, :season)
    end
end