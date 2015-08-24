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
      set_next_fantasy_team

      FantasyDraft.find_by(id: params['fantasy_draft_id']).update_attributes(:player_id => nil)

      Pusher.trigger("fantasy-draft-board-#{params['fantasy_draft_id']}", 'new-draft-pick', fantasy_draft_pick)

      render json: fantasy_draft_pick, status: 201
    else
      render json: fantasy_draft_pick.errors, status: 400
    end
  end

  def update
    fantasy_draft_pick = FantasyDraftPick.where(id: params['id'], fantasy_draft_id: params['fantasy_draft_id']).first
    if fantasy_draft_pick.update(fantasy_draft_pick_params)

      Pusher.trigger("fantasy-draft-board-#{params['fantasy_draft_id']}", 'edit-draft-pick', fantasy_draft_pick)

      render json: fantasy_draft_pick, status: 201
    else
      render json: fantasy_draft_pick.errors, status: 400
    end
  end

  def destroy
    fantasy_draft_pick = FantasyDraftPick.where(id: params['id'], fantasy_draft_id: params['fantasy_draft_id']).first
    if fantasy_draft_pick && fantasy_draft_pick.destroy
      Pusher.trigger("fantasy-draft-board-#{params['fantasy_draft_id']}", 'destroy-draft-pick', fantasy_draft_pick)

      render json: fantasy_draft_pick, status: 200
    else
      render json: fantasy_draft_pick.errors, status: 400
    end
  end

  private
    def fantasy_draft_pick_params
      params.permit(:fantasy_team_id, :fantasy_draft_id, :price, :player_id)
    end

    def set_next_fantasy_team
      @fantasy_draft = FantasyDraft.find_by(id: params['fantasy_draft_id'])
      @fantasy_teams = @fantasy_draft.fantasy_teams.order(:draft_order).pluck(:id)
      @fantasy_draft_picks = @fantasy_draft.fantasy_draft_picks.count

      if @fantasy_draft_picks != (@fantasy_draft.rounds * @fantasy_teams.size)

        # Based on the current fantasy_team_id we need to find the next id in sequential order
        current_index = @fantasy_teams.index(@fantasy_draft.fantasy_team_id)
        p "current fantasy team is #{@fantasy_teams[current_index]}"

        # Find the next fantasy_team_id by recursion
        fantasy_team_id = find_next_pick(current_index)
        # raise fantasy_team_id.to_yaml
        store_new_fantasy_team_id(fantasy_team_id)
        Pusher.trigger("fantasy-draft-board-#{params['fantasy_draft_id']}", 'set-team-thats-up', fantasy_team_id)
      end

    end



    def find_next_pick(index)

      # If the current_index is not within the @fantasy_teams we need to reset to 0
      if (index+1) == @fantasy_teams.size
        index = 0
      else
        index += 1
      end

      fantasy_team_id = @fantasy_teams[index]
      total_picks_for_team = total_picks(fantasy_team_id)

      if total_picks_for_team == @fantasy_draft.rounds
        fantasy_team_id = find_next_pick(index)
      end

      fantasy_team_id
    end


    def total_picks(fantasy_team_id)
      FantasyDraftPick.where(fantasy_draft_id: params['fantasy_draft_id'], fantasy_team_id: fantasy_team_id).count
    end

    def store_new_fantasy_team_id(fantasy_team_id)
      FantasyDraft.find_by(id: params['fantasy_draft_id']).update_attributes(:fantasy_team_id => fantasy_team_id)
    end



end
