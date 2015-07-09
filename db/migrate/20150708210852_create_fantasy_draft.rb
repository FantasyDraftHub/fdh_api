class CreateFantasyDraft < ActiveRecord::Migration
  def change
    create_table :fantasy_drafts do |t|
      t.references :league, index: true, foreign_key: true
      t.references :fantasy_league, index: true, foreign_key: true
      t.references :fantasy_draft_style, index: true, foreign_key: true
      t.integer :max
      t.integer :rounds
      t.string :password
      t.string :subdomain, index: true
      t.string :season, null: false
      t.datetime :starts_at
      t.timestamps
    end
  end
end
