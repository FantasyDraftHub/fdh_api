class CreateFantasyTeams < ActiveRecord::Migration
  def change
    create_table :fantasy_teams do |t|
      t.references :fantasy_league, index: true, foreign_key: true
      t.string :name
      t.string :owner
      t.boolean :active
      t.timestamps
    end
  end
end
