require_relative "../config/environment"

# def change_user
#   message = "please enter user name you wish to switch to\n".colorize(:yellow)
#   slow_print(message)
#
#   while true
#     new_user_name = gets.chomp
#
#     if !new_user_name || new_user_name == ""
#       puts "What gives! Give me a name pls"
#     else
#       set_user(new_user_name)
#
#       puts "SUCCESS!".colorize(:blue)
#       break
#     end
#   end
#
#   slow_print("logging into #{get_user}'s account\n".colorize(:blue))
# end

def who_am_i
  if @current_username != ""
    message = "#{@current_username} is logged in\n".colorize(:blue)
    slow_print(message)
  else
    message2 = "No user is currently logged in\n".colorize(:blue)
    slow_print(message2)
  end

end

def change_user
  output_spacer

  while true
    message = "please enter user name you wish to switch to\n".colorize(:yellow)
    message2 = "enter 'users' to see list of registered users or 'quit' to not change user\n".colorize(:yellow)
    slow_print(message)
    slow_print(message2)
    new_user_name = gets.chomp

    if all_names.include?(new_user_name) == true
      set_user(new_user_name)

      puts "SUCCESS!".colorize(:blue)
      break
    elsif new_user_name == "quit"
      break
    elsif new_user_name == "users"
      list_all_names
    else
      error_message = "No account found with that name!\n"
      slow_print(error_message)
    end
  end

  if get_user != ""
    slow_print("logging into #{get_user}'s account\n".colorize(:blue))
  end
end

# def test_zodiac
#   bday = "12/10"
#   year = 1990
#   month = #some method
#   day = #another method to parse input from user string.
#   sign = Date.new(year, month, day).zodiac_sign
#   sign
# end

#binding.pry
