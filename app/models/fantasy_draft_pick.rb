# == Schema Information
#
# Table name: fantasy_draft_picks
#
#  id               :bigint           not null, primary key
#  price            :integer
#  created_at       :datetime
#  updated_at       :datetime
#  fantasy_draft_id :integer
#  fantasy_team_id  :integer
#  player_id        :integer
#
# Indexes
#
#  index_fantasy_draft_picks_on_fantasy_draft_id  (fantasy_draft_id)
#  index_fantasy_draft_picks_on_fantasy_team_id   (fantasy_team_id)
#  index_fantasy_draft_picks_on_player_id         (player_id)
#
# Foreign Keys
#
#  fk_rails_...  (fantasy_draft_id => fantasy_drafts.id)
#  fk_rails_...  (fantasy_team_id => fantasy_teams.id)
#  fk_rails_...  (player_id => players.id)
#

class FantasyDraftPick < ActiveRecord::Base
  belongs_to :fantasy_draft
  belongs_to :fantasy_team
  belongs_to :player
end
