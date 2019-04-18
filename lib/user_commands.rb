require_relative "../config/environment"
# require "pry"
# require "zodiac"
# require "date"
require_relative './welcome_user'
require_relative './models/user'

def new_user
 message1 = "Please enter new user name\n".colorize(:yellow)
 slow_print(message1)
 name = gets.chomp
 message2 = "Please enter your birthday MM/DD\n".colorize(:yellow)
 slow_print(message2)
 birthday = gets.chomp
 sign = validator(birthday)
 User.create(name: name, birthday: birthday, sign: sign)
end

def validator(bday)
 month = bday.split('/')[0].to_i
 day = bday.split('/')[1].to_i

 if (month.between?(0,12) && day.between?(0,30))
   p get_sign(month, day)

 else
   puts "Enter valid date"
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
