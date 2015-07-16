class FantasyDraftsController < ApplicationController
  before_action :authenticate, except: [ :show ]

  def index
    fantasy_drafts = current_user.fantasy_drafts.includes(:fantasy_teams).order('fantasy_teams.draft_order ASC').all
    render json: fantasy_drafts.to_json({:include => :fantasy_teams}), status: 200
  end

  def show
    fantasy_draft = current_user.fantasy_drafts.where(id: params[:id]).first
    render json: fantasy_draft.to_json({:include => :fantasy_teams}), status: 200
  end

  def panel
    fantasy_draft = current_user.fantasy_drafts.where(id: params[:id]).first
    render json: fantasy_draft.to_json({:include => [:fantasy_teams, :fantasy_draft_picks]}), status: 200
  end

  def board
    fantasy_draft = current_user.fantasy_drafts.where(url: params[:url], password: params[:password]).includes(:fantasy_teams).order('fantasy_teams.draft_order ASC').first
    render json: fantasy_draft.to_json({:include => [:fantasy_teams, :fantasy_draft_picks]}), status: 200
  end

  def create
    fantasy_draft = current_user.fantasy_drafts.new(fantasy_draft_params)
    fantasy_draft.fantasy_draft_style_id = FantasyDraftStyle.find_by_name('Auction').id
    fantasy_draft.season = '2015-2016'
    fantasy_draft.url = generate_url

    if fantasy_draft.save
      render json: fantasy_draft, status: 201
    else
      render json: fantasy_draft.errors, status: 400
    end
  end

  def update

    if fantasy_draft_params[:draft_order]

      fantasy_draft_params[:draft_order].each_with_index do |value, index|
        FantasyTeam.where(:id => value).update_all(:draft_order => index)
      end

      fantasy_drafts = current_user.fantasy_drafts.includes(:fantasy_teams).order('fantasy_teams.draft_order').all
      render json: fantasy_drafts.to_json({:include => :fantasy_teams}), status: 200

    else
      fantasy_draft = current_user.fantasy_drafts.find_by_id(params['id'])
      if fantasy_draft.update(fantasy_draft_params)

        Pusher.trigger("fantasy-draft-board-#{params['id']}", 'draft-update', fantasy_draft)

        render json: fantasy_draft, status: 201
      else
        render json: fantasy_draft.errors, status: 400
      end
    end
  end

  private
    def fantasy_draft_params
      params.permit(:id, :fantasy_draft_style_id, :name, :max, :rounds, :password, :url, :starts_at, :season, :player_id, :draft_order => [])
    end

    def generate_url
      loop do
        url = Haikunator.haikunate(100)
        break url unless FantasyDraft.exists?(url: url)
      end
    end
end