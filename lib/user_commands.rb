require_relative "../config/environment"
require_relative './welcome_user'
require_relative './models/user'

def new_user
  while true
    message1 = "Please enter new user name\n".colorize(:yellow)
    slow_print(message1)
    name = gets.chomp
    if name == "quit"
      break
    elsif all_names.include?(name) == true
      error_message3 = "Account with that name already exists!\n".colorize(:red)
      slow_print(error_message3)
      next
    end
    message2 = "Please enter your birthday MM/DD\n".colorize(:yellow)
    slow_print(message2)
    birthday = gets.chomp
    if birthday == "quit"
      break
    end
    sign = validator(birthday)
    if sign != ""
      new_user = User.create(name: name, birthday: birthday, sign: sign)

      ### Change user to newly created user. Code below
      set_user(new_user.name)
      create_my_reading
      slow_print("logging into #{new_user.name}'s account\n".colorize(:blue))
      break
    end
  end
end

def validator(bday)
  error_message = "Input invalid. Enter date in format shown above\n".colorize(:red)
  if bday.length == 5 && bday.count("0-9") == 4 && bday.count("/") == 1
    month = bday.split('/')[0].to_i
    day = bday.split('/')[1].to_i

    if (month.between?(0,12) && day.between?(0,30))
      p get_sign(month, day)
    else
      slow_print(error_message)
      return ""
    end
  else
    slow_print(error_message)
    return ""
  end
end

def get_sign(month, day, year=1990)
 sign = Date.new(year, month, day).zodiac_sign
 sign
end

def all_names
  User.pluck :name
end

def list_all_names
  all_names.each {|name| puts name.colorize(:blue)}
end
