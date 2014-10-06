#!/usr/bin/env ruby
require 'faraday'

$faraday = Faraday.new(:url => 'https://api.justyo.co/') do |faraday|
  faraday.request  :url_encoded             # form-encode POST params
  faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
end
$faraday.post('/yoall', {api_token: ENV['YO_API_TOKEN'], link: 'https://en.wikipedia.org/wiki/Special:Random'})

