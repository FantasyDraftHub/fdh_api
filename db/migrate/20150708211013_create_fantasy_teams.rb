class CreateFantasyTeams < ActiveRecord::Migration
  def change
    create_table :fantasy_teams do |t|
      t.references :fantasy_draft, index: true, foreign_key: true
      t.string :name
      t.string :owner
      t.boolean :active
      t.integer :draft_order
      t.timestamps
    end
  end
end
