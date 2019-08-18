User.delete_all
User.create(email: 'brett@hammond.io', password: 'password')

League.delete_all
League.create([
    {
        id: 1,
        name: 'National Football League',
        key: 'NFL'
    }
])
puts "Leagues have been seeded."

Team.delete_all
Team.create([
    {
        id: 1,
        league_id: 1,
        city: 'Free',
        name: 'Agent',
        key: 'FA',
    },
    {
        id: 2,
        league_id: 1,
        city: 'Arizona',
        name: 'Cardinals',
        key: 'ARI',
    },
    {
        id: 3,
        league_id: 1,
        city: 'Atlanta',
        name: 'Falcons',
        key: 'ATL',
    },
    {
        id: 4,
        league_id: 1,
        city: 'Baltimore',
        name: 'Ravens',
        key: 'BAL',
    },
    {
        id: 5,
        league_id: 1,
        city: 'Buffalo',
        name: 'Bills',
        key: 'BUF',
    },
    {
        id: 6,
        league_id: 1,
        city: 'Carolina',
        name: 'Panthers',
        key: 'CAR',
    },
    {
        id: 7,
        league_id: 1,
        city: 'Chicago',
        name: 'Bears',
        key: 'CHI',
    },
    {
        id: 8,
        league_id: 1,
        city: 'Cincinnati',
        name: 'Bengals',
        key: 'CIN',
    },
    {
        id: 9,
        league_id: 1,
        city: 'Cleveland',
        name: 'Browns',
        key: 'CLE',
    },
    {
        id: 10,
        league_id: 1,
        city: 'Dallas',
        name: 'Cowboys',
        key: 'DAL',
    },
    {
        id: 11,
        league_id: 1,
        city: 'Denver',
        name: 'Broncos',
        key: 'DEN',
    },
    {
        id: 12,
        league_id: 1,
        city: 'Detroit',
        name: 'Lions',
        key: 'DET',
    },
    {
        id: 13,
        league_id: 1,
        city: 'Green Bay',
        name: 'Packers',
        key: 'GB',
    },
    {
        id: 14,
        league_id: 1,
        city: 'Houston',
        name: 'Texans',
        key: 'HOU',
    },
    {
        id: 15,
        league_id: 1,
        city: 'Indianapolis',
        name: 'Colts',
        key: 'IND',
    },
    {
        id: 16,
        league_id: 1,
        city: 'Jacksonville',
        name: 'Jaguars',
        key: 'JAC',
    },
    {
        id: 17,
        league_id: 1,
        city: 'Kansas City',
        name: 'Chiefs',
        key: 'KC',
    },
    {
        id: 18,
        league_id: 1,
        city: 'Miami',
        name: 'Dolphins',
        key: 'MIA',
    },
    {
        id: 19,
        league_id: 1,
        city: 'Minnesota',
        name: 'Vikings',
        key: 'MIN',
    },
    {
        id: 20,
        league_id: 1,
        city: 'New England',
        name: 'Patriots',
        key: 'NE',
    },
    {
        id: 21,
        league_id: 1,
        city: 'New Orleans',
        name: 'Saints',
        key: 'NO',
    },
    {
        id: 22,
        league_id: 1,
        city: 'New York',
        name: 'Giants',
        key: 'NYG',
    },
    {
        id: 23,
        league_id: 1,
        city: 'New York',
        name: 'Jets',
        key: 'NYJ',
    },
    {
        id: 24,
        league_id: 1,
        city: 'Oakland',
        name: 'Raiders',
        key: 'OAK',
    },
    {
        id: 25,
        league_id: 1,
        city: 'Philadelphia',
        name: 'Eagles',
        key: 'PHI',
    },
    {
        id: 26,
        league_id: 1,
        city: 'Pittsburgh',
        name: 'Steelers',
        key: 'PIT',
    },
    {
        id: 27,
        league_id: 1,
        city: 'San Diego',
        name: 'Chargers',
        key: 'LAC',
    },
    {
        id: 28,
        league_id: 1,
        city: 'San Francisco',
        name: '49ers',
        key: 'SF',
    },
    {
        id: 29,
        league_id: 1,
        city: 'Seattle',
        name: 'Seahawks',
        key: 'SEA',
    },
    {
        id: 30,
        league_id: 1,
        city: 'Los Angeles',
        name: 'Rams',
        key: 'LAR',
    },
    {
        id: 31,
        league_id: 1,
        city: 'Tampa Bay',
        name: 'Buccaneers',
        key: 'TB',
    },
    {
        id: 32,
        league_id: 1,
        city: 'Tennessee',
        name: 'Titans',
        key: 'TEN',
    },
    {
        id: 33,
        league_id: 1,
        city: 'Washington',
        name: 'Redskins',
        key: 'WAS',
    }
])
puts "Teams have been seeded."


Position.delete_all
Position.create([
    {
        id: 1,
        league_id: 1,
        name: 'Quarterback',
        key: 'QB'
    },
    {
        id: 2,
        league_id: 1,
        name: 'Running Back',
        key: 'RB'
    },
    {
        id: 3,
        league_id: 1,
        name: 'Wide Reciever',
        key: 'WR'
    },
    {
        id: 4,
        league_id: 1,
        name: 'Tight End',
        key: 'TE'
    },
    {
        id: 5,
        league_id: 1,
        name: 'Kicker',
        key: 'K'
    },
    {
        id: 6,
        league_id: 1,
        name: 'Defense',
        key: 'DEF'
    }
])
puts "Positions have been seeded."


# Get all Players
Player.delete_all
players = FantasyFootballNerd.players
players.each do |player|

    #   playerId: '2684'
    #   active: '1'
    #   jersey: '0'
    #   lname: Murray
    #   fname: Patrick
    #   team: TB
    #   position: K
    #   height: 5-7
    #   weight: '182'
    #   dob: 0000-00-00
    #   college: Fordham
    if player['position'] == 'JAC'
        player['position'] = 'RB'
    end

    position = Position.find_by_key(player['position'])
    team     = Team.find_by_key(player['team'])

    if !team
        puts player['team']
    end

    if !position
        puts player['position']
    end
    Player.create(
        league_id: 1,
        team_id: team.id,
        position_id: position.id,
        first_name: player['fname'],
        last_name: player['lname'],
        active: player['active'],
        season: '2015-2016',
        ffnerd_player_id: player['playerId'],
    )

end
puts "Players have been seeded."


FantasyDraftStyle.delete_all
FantasyDraftStyle.create([
    {
        id: 1,
        name: 'Auction'
    },
    {
        id: 2,
        name: 'Snake'
    },
])
puts "Fantasy Draft Styles have been seeded."

FantasyRankings.new
puts "Fantasy Player Rankings have been seeded."









