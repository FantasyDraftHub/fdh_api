class AddFantasyTeamIdToFantasyDraft < ActiveRecord::Migration
  def change
    add_reference :fantasy_drafts, :fantasy_team, index: true, foreign_key: true
  end
end
