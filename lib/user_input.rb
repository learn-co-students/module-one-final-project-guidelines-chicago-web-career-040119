def output_spacer
  puts "\n"
  2.times {|i| puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~:>"}
end

def get_user_input
  input = ""
  while input != "quit"
    puts "What command do you want to run?"
    input = gets.chomp
    case input
    when "commands"
      list_commands
    when "users"
      puts User.all
    when "new user"
      #we need to create a method for initializing a new user!!!
      puts "we need to create this method!!!"
    when "whoami?"
      #we need to create a method for initializing a new user!!!
      #code below is pseudo code
      #User.all.find_by name: = logged_user
      who_am_i
    when "change user"
      change_user
    end
  end
end

def list_commands
  text = <<-MAGIC
  commands --> list all commands in VHR
  users --> list all registered users
  new user --> create a new user
  whoami? --> see the current logged in user
  change user -- switch VHR to another user
  get horoscope --> see your horoscope reading for today
  find horoscope --> see list of your saved horoscopes
  quit --> quit the program
  MAGIC

  puts text
  output_spacer
end

#binding.pry
"wut"
