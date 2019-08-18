class FantasyRankings

  def initialize
    build_tiers
    build_pricing
  end

  def build_tiers
    tiered_players = [
        'QB': [],
        'RB': [],
        'WR': [],
        'TE': [],
        'K': [],
        'DEF': []
    ]

    players = FantasyFootballNerd.tiers
    # ap players
    #   "playerId" => "1865",
    #   "position" => "K",
    #   "tier" => "1",
    #   "displayName" => "Greg Zuerlein",
    #   "team" => "LAR"
    #
    players.each do |player|
      tiered_players.first[player['position'].to_sym] << player
    end
    # ap tiered_players

    tiered_players.first.each do |position|
      position.second.each_with_index do |player, index|
        Player.where(ffnerd_player_id: player['playerId']).first.update_attributes(tier: player['tier'], tier_index: index+1)
      end
    end
  end

  def build_pricing
    auction_styles = FantasyFootballNerd.auction_enhanced
    # "Teams": 12,
    #     "SalaryCap": 200,
    #     "Players": [
    #     {
    #         "playerId": "3582",
    #         "ppr": "0",
    #         "minPrice": 58,
    #         "maxPrice": 70,
    #         "avgPrice": 64,
    #         "displayName": "Saquon Barkley",
    #         "team": "NYG",
    #         "position": "RB"
    #     },


    auction_styles.each do |auction_style|

      if auction_style['Teams'] == 12 && auction_style['SalaryCap'] == 200
        auction_style['Players'].each do |player|
          # "playerId" => "3582",
          # "ppr" => "0",
          # "minPrice" => 58,
          # "maxPrice" => 70,
          # "avgPrice" => 64,
          # "displayName" => "Saquon Barkley",
          # "team" => "NYG",
          # "position" => "RB"
          Player.where(ffnerd_player_id: player['playerId']).first.update_attributes(min_price: player['minPrice'], max_price: player['maxPrice'], avg_price: player['avgPrice'])
        end
      end


    end
    # ap tiered_players
    #
    # tiered_players.first.each do |position|
    #   position.second.each_with_index do |player, index|
    #     Player.where(ffnerd_player_id: player['playerId']).first.update_attributes(tier: player['tier'], tier_index: index+1)
    #   end
    # end
  end




end