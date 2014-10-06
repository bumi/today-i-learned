require 'sinatra'
require 'faraday'

$faraday = Faraday.new(:url => 'https://api.justyo.co/') do |faraday|
  faraday.request  :url_encoded             # form-encode POST params
  faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
end

get '/' do
  'Subscribe to TODAYILEARNED on YO! to receive a daily little piece of knowledge'
end

get '/gimme' do
  if params[:username]
    puts $faraday.post('/yoall', {api_token: ENV['YO_API_TOKEN'], username: params[:username], link: 'https://en.wikipedia.org/wiki/Special:Random'})
  end
  "enjoy, buddy!"
end

