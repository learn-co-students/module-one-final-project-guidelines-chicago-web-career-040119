require_relative "../config/environment"
require_relative './models/user'
require_relative './models/reading'
require_relative './models/horoscope'

def match_me_cosmos
  if @current_username == ""
    message = "please log in to find your match\n".colorize(:blue)
    slow_print(message)
  else
    matched_sign = my_reading_today.horoscope.compatibility
    message = "Your ideal match today is a #{matched_sign}\n".colorize(:blue)
    slow_print(message)
    message2 = "Searching for match...\n"
    slow_print(message2)
    slow_print("...\n")
    slow_print(".....\n")
    slow_print(".......\n")
    array_matches = User.where('sign = ?', matched_sign)
    if array_matches == []
      sad_message = "The cosmos couldn't find a match for you :.(\n"
      slow_print(sad_message)
    else
      my_match = array_matches.sample
      match_message = "The stars have aligned...\n"
      match_message2 = "#{my_match.name} is your match!\n"
      slow_print(match_message)
      slow_print(match_message2)
    end
  end
end
