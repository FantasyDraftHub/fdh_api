class CreateFantasyDraftPick < ActiveRecord::Migration
  def change
    create_table :fantasy_draft_picks do |t|
      t.references :fantasy_draft, index: true, foreign_key: true
      t.references :fantasy_team, index: true, foreign_key: true
      t.references :player, index: true, foreign_key: true
      t.integer :price
      t.timestamps
    end
  end
end
