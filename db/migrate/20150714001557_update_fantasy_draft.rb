class UpdateFantasyDraft < ActiveRecord::Migration[5.2]
  def change
    add_reference :fantasy_drafts, :player, index: true, foreign_key: true
  end
end
