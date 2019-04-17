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

def who_am_i
  message = "#{@current_username} is logged in\n"
  slow_print(message)
  output_spacer
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
