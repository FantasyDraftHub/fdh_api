class CreatePlayer < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.references :league, index: true, foreign_key: true
      t.references :team, index: true, foreign_key: true
      t.references :position, index: true, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :season
      t.boolean :active
    end
  end
end
