class FantasyDraftOrder < ActiveRecord::Base
  belongs_to :fantasy_league
  belongs_to :fantasy_team
  belongs_to :fantasy_draft
end
