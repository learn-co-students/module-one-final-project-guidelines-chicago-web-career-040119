require_relative '../config/environment'
require 'rest-client'
require 'json'
require 'pry'
require 'zodiac'
require 'date'


response_string = RestClient.post('https://aztro.sameerkumar.website/', :sign => 'aries', :day => 'today'
response_hash = JSON.parse(response_string)

binding.pry

def get_name_from_user
  puts "Please enter your name"
  gets.chomp
end

def get_birthdate_from_user
  puts "Please enter your birthdate as" + Date.new("YYYY/MM/DD").zodiac_sign
  gets.chomp
end

def get_sign_for_user
  zsign = Date.new().zodiac_sign

  puts "Your horoscope sign is #{zsign}"

end


def whoami?
  self.name
end

# def change_user
#
# end

#puts "HELLO WORLD"
