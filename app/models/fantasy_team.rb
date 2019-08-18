# == Schema Information
#
# Table name: fantasy_teams
#
#  id               :bigint           not null, primary key
#  active           :boolean
#  draft_order      :integer
#  name             :string
#  owner            :string
#  created_at       :datetime
#  updated_at       :datetime
#  fantasy_draft_id :integer
#
# Indexes
#
#  index_fantasy_teams_on_fantasy_draft_id  (fantasy_draft_id)
#
# Foreign Keys
#
#  fk_rails_...  (fantasy_draft_id => fantasy_drafts.id)
#

class FantasyTeam < ActiveRecord::Base
    belongs_to :fantasy_draft


    def name_and_owner
        "#{name} - #{owner}"
    end

    def owner_and_team
        "#{owner} - #{name}"
    end

end
