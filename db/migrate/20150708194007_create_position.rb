class CreatePosition < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.references :league, index: true, foreign_key: true
      t.string :name
      t.string :key, index: true
    end
  end
end
