class AddFantasyTeamIdToFantasyDraft < ActiveRecord::Migration[5.2]
  def change
    add_reference :fantasy_drafts, :fantasy_team, index: true, foreign_key: true
  end
end
