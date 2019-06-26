require "sinatra"
require "httparty"

app_key = 'M2X4WR735AODNYMJ6C4W'
$req = HTTParty.get("https://www.eventbriteapi.com/v3/events/search/?q=baking&token=#{app_key}")

get '/' do
  erb :home
end

get '/cakes' do
  erb :cakes
end

get '/cookies' do
  erb :cookies
end

get '/muffins' do
  erb :muffins
end

get '/events' do
  erb :events
end
