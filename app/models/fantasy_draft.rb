# == Schema Information
#
# Table name: fantasy_drafts
#
#  id                     :bigint           not null, primary key
#  max                    :integer
#  name                   :string           not null
#  password               :string
#  rounds                 :integer
#  season                 :string           not null
#  starts_at              :datetime
#  url                    :string
#  created_at             :datetime
#  updated_at             :datetime
#  fantasy_draft_style_id :integer
#  fantasy_team_id        :integer
#  player_id              :integer
#  user_id                :integer
#
# Indexes
#
#  index_fantasy_drafts_on_fantasy_draft_style_id  (fantasy_draft_style_id)
#  index_fantasy_drafts_on_fantasy_team_id         (fantasy_team_id)
#  index_fantasy_drafts_on_player_id               (player_id)
#  index_fantasy_drafts_on_url                     (url)
#  index_fantasy_drafts_on_user_id                 (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (fantasy_draft_style_id => fantasy_draft_styles.id)
#  fk_rails_...  (fantasy_team_id => fantasy_teams.id)
#  fk_rails_...  (player_id => players.id)
#  fk_rails_...  (user_id => users.id)
#

class FantasyDraft < ActiveRecord::Base
  belongs_to :user
  has_many :fantasy_teams
  has_many :fantasy_draft_picks
  belongs_to :fantasy_draft_style

  validates :name, presence: true
end
