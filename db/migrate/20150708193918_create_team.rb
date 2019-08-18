class CreateTeam < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.references :league, index: true, foreign_key: true
      t.string :city
      t.string :name
      t.string :key, index: true
    end
  end
end
