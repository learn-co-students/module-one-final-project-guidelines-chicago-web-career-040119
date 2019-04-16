require "pry"
require_relative './welcome_user'

def change_user
  message = "please enter user name you wish to switch to\n"
  slow_print(message)


  while true
    new_user_name = gets.chomp

    if !new_user_name || new_user_name == ""
      puts "What gives! Give me a name pls"
    else
      set_user(new_user_name)

      puts "SUCCESS!"
      break
    end
  end

  slow_print("logging into #{get_user}'s account\n")
end

#binding.pry
