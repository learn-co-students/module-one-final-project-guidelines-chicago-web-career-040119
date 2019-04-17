require_relative '../config/environment'
require_relative '../lib/welcome_user'
require_relative '../lib/logged_user'
require 'rest-client'
require 'json'
require 'pry'
require 'zodiac'
require 'date'
require 'colorize'
require 'colorized_string'

@current_username = ""

def set_user(username)
  @current_username = username
end

def get_user
  @current_username
end

add_horoscopes_to_database

welcome_message

commands_message

log_in_prompt

get_user_input

# def get_name_from_user
#   puts "Please enter your name"
#   gets.chomp
# end
#
# def get_birthdate_from_user
#   puts "Please enter your birthdate as" + Date.new("YYYY/MM/DD").zodiac_sign
#   gets.chomp
# end
#
# def get_sign_for_user
#   zsign = Date.new().zodiac_sign
#
#   puts "Your horoscope sign is #{zsign}"
#
# end


# def whoami?
#   self.name
# end

# binding.pry
# def change_user
#
# end

#puts "HELLO WORLD"
