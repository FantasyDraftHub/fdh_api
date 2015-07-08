require 'open-uri'
require 'json'

class FantasyFootballNerd

  API_KEY = "dw5bawd9qdza"
  BASE_URL = "http://fantasyfootballnerd.com/service"
  FORMAT   = "json"
  SERVICES = {
    teams: 'nfl-teams',
    schedule: 'schedule',
    players: 'players',
    byes: 'byes',
    injuries: 'injuries',
    auction: 'auction',
    draft_rankings: 'draft-rankings',
    draft_projections: 'draft-projections',
    weekly_rankings: 'weekly-rankings',
    weekly_projections: 'weekly-projections'
  }

  def self.feed_url(service)
    "#{BASE_URL}/#{SERVICES[service]}/#{FORMAT}/#{API_KEY}"
  end

  def self.get_resource(url)
    JSON.parse(open(url).read)
  end

  def self.teams
    url = feed_url(:teams)
    response = get_resource(url)
    response['NFLTeams']
  end

  def self.schedule
    url = feed_url(:schedule)
    response = get_resource(url)
    response['Schedule']
  end

  def self.players(position=nil)
    url = feed_url(:players)
    if not position.nil?
      url += "/#{position.upcase}"
    end
    response = get_resource(url)
    response['Players']
  end

  def self.auction
    url = feed_url(:auction)
    response = get_resource(url)
    response['AuctionValues']
  end

  def self.draft_rankings
    url = feed_url(:draft_rankings)
    response = get_resource(url)
    response['DraftRankings']
  end

  def self.draft_projections(position=nil)
    url = feed_url(:draft_projections)
    if not position.nil?
      url += "/#{position.upcase}"
    end
    response = get_resource(url)
    response['DraftProjections']
  end

  def self.byes
    url = feed_url(:byes)
    get_resource(url)
  end

end

# response = FantasyFootballNerd.teams
# response = FantasyFootballNerd.schedule

# response = FantasyFootballNerd.players
# response = FantasyFootballNerd.auction
# response = FantasyFootballNerd.draft_rankings
# response = FantasyFootballNerd.byes
# raise response.to_yaml