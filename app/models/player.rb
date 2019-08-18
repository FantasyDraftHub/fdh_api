# == Schema Information
#
# Table name: players
#
#  id               :bigint           not null, primary key
#  active           :boolean
#  avg_price        :integer
#  first_name       :string
#  last_name        :string
#  max_price        :integer
#  min_price        :integer
#  season           :string
#  tier             :integer
#  tier_index       :integer
#  ffnerd_player_id :integer
#  league_id        :integer
#  position_id      :integer
#  team_id          :integer
#
# Indexes
#
#  index_players_on_league_id    (league_id)
#  index_players_on_position_id  (position_id)
#  index_players_on_team_id      (team_id)
#
# Foreign Keys
#
#  fk_rails_...  (league_id => leagues.id)
#  fk_rails_...  (position_id => positions.id)
#  fk_rails_...  (team_id => teams.id)
#

class Player < ActiveRecord::Base
  belongs_to :league
  belongs_to :team
  belongs_to :position

  def name
    "#{first_name} #{last_name}"
  end
end
