class CreateFantasyDraft < ActiveRecord::Migration[5.2]
  def change
    create_table :fantasy_drafts do |t|
      t.references :fantasy_draft_style, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :name, null: false
      t.integer :max
      t.integer :rounds
      t.string :password
      t.string :url, index: true
      t.string :season, null: false
      t.datetime :starts_at
      t.timestamps
    end
  end
end
