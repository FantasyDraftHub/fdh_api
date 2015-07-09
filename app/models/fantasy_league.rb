class FantasyLeague < ActiveRecord::Base
  belongs_to :user
  has_many :fantasy_teams
  has_many :fantasy_drafts

  validates :name, presence: true
end
