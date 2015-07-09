class FantasyDraft < ActiveRecord::Base
  belongs_to :fantasy_league
  belongs_to :fantasy_draft_style
end
