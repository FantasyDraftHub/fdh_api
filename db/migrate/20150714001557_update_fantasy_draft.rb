class UpdateFantasyDraft < ActiveRecord::Migration
  def change
    add_reference :fantasy_drafts, :player, index: true, foreign_key: true
  end
end
