require_relative "../config/environment"
require_relative "./models/user"
require_relative "./models/reading"
require_relative "./models/horoscope"
require_relative "./welcome_user"

def current_user
  User.find_by name: @current_username
end

def create_my_reading
  current_user_id = current_user.id
  #BESTTTTT
  latest_horoscope = Horoscope.where("sign = :sign", { sign: current_user.sign.downcase}).last

  latest_horoscope_id = latest_horoscope.id

  Reading.create(user_id: current_user_id, horoscope_id: latest_horoscope_id)
end

def check_reading_created
  current_time_array = Time.now.to_a[3..5]

  latest_reading = current_user.readings.last
  latest_reading_time = latest_reading.horoscope.current_date.to_a[3..5]
  if latest_reading_time == current_time_array
    return true
  else
    return false
  end
end

def my_reading_today
  Reading.where("user_id = :user_id", { user_id: current_user.id}).last
end

def print_horoscope_description
  current_user = User.find_by name: @current_username
  current_user_id = current_user.id

  my_description = my_reading_today.horoscope.description

  message = my_description + "\n"
  slow_print(message.colorize(:blue))
end

def list_horoscope_dates
  horoscope_list = current_user.horoscopes.map { | horoscope |
    horoscope.current_date.strftime("%m/%d/%Y")
  }
end

def find_horoscope
  message = "see your past horoscopes by entering a corresponding number\n".colorize(:yellow)
  message2 = "enter '!' for a random horoscope and 'quit' to exit\n".colorize(:yellow)

  while true
    output_spacer

    count = 1
    list_horoscope_dates.each {|horo_date|
      puts "#{count}: ".colorize(:red) + horo_date.colorize(:blue)
      count += 1
    }
    output_spacer

    slow_print(message)
    slow_print(message2)

    selection = gets.chomp

    if selection == "!"
      output_spacer
      description = current_user.horoscopes.sample.description + "\n"
      slow_print(description.colorize(:blue))
    elsif selection == "quit"
      break
    elsif selection.length == selection.count("0-9")
      output_spacer
      description2 = current_user.horoscopes[selection.to_i - 1].description + "\n"
      slow_print(description2.colorize(:blue))
    else
      output_spacer
      error_message = "command entered is invalid\n".colorize(:red)
      slow_print(error_message)
    end
  end

end
