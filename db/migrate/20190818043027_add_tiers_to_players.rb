class AddTiersToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :tier, :integer
    add_column :players, :tier_index, :integer
    add_column :players, :min_price, :integer
    add_column :players, :max_price, :integer
    add_column :players, :avg_price, :integer
  end
end
