class FantasyDraftPicksController < ApplicationController
  before_action :authenticate

  def index
    fantasy_draft_picks = FantasyDraftPick.where(fantasy_draft_id: params['fantasy_draft_id'])
    render json: fantasy_draft_picks, status: 200
  end

  def show
    fantasy_draft_pick = FantasyDraftPick.where(id: params['id'], fantasy_draft_id: params['fantasy_draft_id']).first
    render json: fantasy_draft_pick, status: 200
  end

  def create
    fantasy_draft_pick = FantasyDraftPick.new(fantasy_draft_pick_params)
    if fantasy_draft_pick.save
      FantasyDraft.where(:id => params['fantasy_draft_id']).update_all(:player_id => nil)

      Pusher.trigger("fantasy-draft-board-#{params['fantasy_draft_id']}", 'new-draft-pick', fantasy_draft_pick)

      render json: fantasy_draft_pick, status: 201
    else
      render json: fantasy_draft_pick.errors, status: 400
    end
  end

  def update
    fantasy_draft_pick = FantasyDraftPick.where(id: params['id'], fantasy_draft_id: params['fantasy_draft_id']).first
    if fantasy_draft_pick.update(fantasy_draft_pick_params)
      render json: fantasy_draft_pick, status: 201
    else
      render json: fantasy_draft_pick.errors, status: 400
    end
  end

  private
    def fantasy_draft_pick_params
      params.permit(:fantasy_team_id, :fantasy_draft_id, :price, :player_id)
    end
end
