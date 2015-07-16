class FantasyTeam < ActiveRecord::Base
    belongs_to :fantasy_draft


    def name_and_owner
        "#{name} - #{owner}"
    end

    def owner_and_team
        "#{owner} - #{name}"
    end

end
