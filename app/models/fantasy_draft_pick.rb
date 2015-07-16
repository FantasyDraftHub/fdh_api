class FantasyDraftPick < ActiveRecord::Base
  belongs_to :fantasy_draft
  belongs_to :fantasy_team
  belongs_to :player
end