class AddInternalPlayerIdtoPlayer < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :ffnerd_player_id, :integer
  end
end
