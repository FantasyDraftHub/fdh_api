# == Schema Information
#
# Table name: teams
#
#  id        :bigint           not null, primary key
#  city      :string
#  key       :string
#  name      :string
#  league_id :integer
#
# Indexes
#
#  index_teams_on_key        (key)
#  index_teams_on_league_id  (league_id)
#
# Foreign Keys
#
#  fk_rails_...  (league_id => leagues.id)
#

class Team < ActiveRecord::Base
  belongs_to :league
  has_many :players

  def full_name
    "#{city} #{name}"
  end
end
