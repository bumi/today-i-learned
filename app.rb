require 'sinatra'
require 'faraday'
require 'yaml'
$faraday = Faraday.new(:url => 'https://api.justyo.co/') do |faraday|
  faraday.request  :url_encoded             # form-encode POST params
  faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
end

$brain = YAML.load(File.read('./brain.yml'))
get '/' do
  'Subscribe to TODAYILEARNED on YO! to receive a daily little piece of knowledge'
end

get '/today' do
  $brain.sample
end

get '/gimme' do
  if params[:username]
    puts $faraday.post('/yo', {api_token: ENV['YO_API_TOKEN'], username: params[:username], link: 'https://en.wikipedia.org/wiki/Special:Random'})
  end
  "enjoy, buddy!"
end

