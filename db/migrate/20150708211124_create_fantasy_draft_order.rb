class CreateFantasyDraftOrder < ActiveRecord::Migration
  def change
    create_table :fantasy_draft_orders do |t|
      t.references :fantasy_league, index: true, foreign_key: true
      t.references :fantasy_draft, index: true, foreign_key: true
      t.references :fantasy_team, index: true, foreign_key: true
      t.integer :position
      t.timestamps
    end
  end
end
