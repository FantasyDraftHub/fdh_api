class FantasyDraft < ActiveRecord::Base
  belongs_to :user
  has_many :fantasy_teams
  has_many :fantasy_draft_picks
  belongs_to :fantasy_draft_style

  validates :name, presence: true
end