class CreateFantasyLeague < ActiveRecord::Migration
  def change
    create_table :fantasy_leagues do |t|
      t.references :league, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :name, null: false
      t.timestamps
    end
  end
end
