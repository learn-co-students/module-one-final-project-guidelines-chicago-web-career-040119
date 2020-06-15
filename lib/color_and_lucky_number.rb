require_relative "../config/environment"

def find_color
  output_spacer
  my_color = current_user.horoscopes.last.color

  message = "your optimal color for today is #{my_color}\n".colorize(:blue)
  slow_print(message)
end

def lucky_number
  output_spacer
  my_number = current_user.horoscopes.last.lucky_number
  message = "your lucky number for today is #{my_number}\n".colorize(:blue)
  slow_print(message)
end
