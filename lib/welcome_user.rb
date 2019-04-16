require 'pry'

def slow_print(text)
  (0..text.length).each { |num|
    print text[num]
    sleep(0.03)
  }
end

def output_spacer
  puts "\n"
  2.times {|i| puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~:>"}
end

def welcome_message
  message = "Welcome to the Virtual Horoscope Reader"
  slow_print(message)
  output_spacer
end

def commands_message
  message = "Enter 'commands' to see all available commands"
  slow_print(message)
  output_spacer
end

def method_name
  message = "Enter your name to log in and get horoscope"
  slow_print(message)
  output_spacer
end



#binding.pry
"wut"
