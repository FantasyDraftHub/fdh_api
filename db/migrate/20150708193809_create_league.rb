class CreateLeague < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.string :name
      t.string :key
    end
  end
end
