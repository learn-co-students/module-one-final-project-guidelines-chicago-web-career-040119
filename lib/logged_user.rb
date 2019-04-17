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
  message = "#{@current_username} is logged in\n".colorize(:blue)
  slow_print(message)
end

def change_user
  output_spacer

  while true
    message = "please enter user name you wish to switch to\n".colorize(:yellow)
    slow_print(message)
    new_user_name = gets.chomp

    if all_names.include?(new_user_name) == true
      set_user(new_user_name)

      puts "SUCCESS!".colorize(:blue)
      break
    else
      error_message = "No account found with that name!\n"
      slow_print(error_message)
    end
  end

  slow_print("logging into #{get_user}'s account\n".colorize(:blue))
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
