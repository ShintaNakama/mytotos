# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'net/http'
require 'json'
require 'uri'

uri = URI.parse('http://api.football-data.org/v1/competitions/464/fixtures')
req = Net::HTTP::Get.new(uri.request_uri)
req["X-Auth-Token"] = "795b97a04cda41f8b6bb0686792fd5ad"
res = Net::HTTP.start(uri.host, uri.port) {|http|
http.request(req)}



json = ActiveSupport::JSON.decode(res.body)

json["fixtures"].each do |data|
    Game.create(:date => data['date'], :status => data['status'], :matchday => data['matchday'], :home_team_name => data['homeTeamName'], :away_team_name => data['awayTeamName'], :goals_home_team => data['result']['goalsHomeTeam'], :goals_away_team => data['result']['goalsAwayTeam'])
end