require_relative "../config/environment"
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
      #we need to create a method for initializing a new user!!!
      new_user
    when "whoami?"
      #we need to create a method for initializing a new user!!!
      #code below is pseudo code
      #User.all.find_by name: = logged_user
      who_am_i
    when "change user"
      change_user
    when "get horoscope"
        get_my_horoscope
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
  change user -- switch VHR to another user
  get horoscope --> see your horoscope reading for today
  find horoscope --> see list of your saved horoscopes
  quit --> quit the program
  MAGIC

  puts text
end

def all_names
  User.pluck :name
end

def list_all_names
  all_names.each {|name| puts name.colorize(:blue)}
end

#binding.pry
"wut"
