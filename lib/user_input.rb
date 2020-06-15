require_relative "../config/environment"
require_relative "./models/horoscope"
# def output_spacer
#   puts "\n"
#   2.times {|i| puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~:>"}
# end

def get_user_input
  input = ""
  while input != "quit"
    output_spacer
    puts "Enter a command".colorize(:yellow)
    input = gets.chomp
    case input
    when "commands"
      list_commands
    when "users"
      list_all_names
    when "new user"
      new_user
    when "whoami?"
      who_am_i
    when "change user", "log in"
      change_user
      if @current_username != "" && check_reading_created != true
        create_my_reading
      end
    when "get horoscope"
      print_horoscope_description
    when "find horoscope"
      find_horoscope
    when "match me"
      match_me_cosmos
    when "my color"
      find_color
    when "lucky number"
      lucky_number
    when "quit"
      break
    else
      error_message = "That command does not exist\n".colorize(:blue)
      slow_print(error_message)
    end
  end
end

def list_commands
  text = <<-MAGIC
  commands --> list all commands in VHR
  users --> list all registered users
  new user --> create a new user
  whoami? --> see the current user logged in
  change user or log in -- switch VHR to another user
  get horoscope --> see your horoscope reading for today
  find horoscope --> see list of your saved horoscopes
  match me --> find a cosmologically determined blind date
  my color --> the cosmos thinks you look great in this color today
  lucky number --> see your cosmologically chosen lucky number
  quit --> quit the program
  MAGIC

  puts text
end

#binding.pry
"wut"
