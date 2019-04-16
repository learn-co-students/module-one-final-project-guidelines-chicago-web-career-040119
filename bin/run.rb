require_relative '../config/environment'
require 'rest-client'
require 'json'
require 'pry'

response_string = RestClient.post('https://aztro.sameerkumar.website/', :sign => 'aries', :day => 'today'
response_hash = JSON.parse(response_string)

binding.pry



puts "HELLO WORLD"
