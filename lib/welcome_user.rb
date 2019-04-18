def slow_print(text)
  (0..text.length).each { |num|
    print text[num]
    sleep(0.04)
  }
end

# def slow_print(text)
#   (0..text.length).each { |num|
#     print text[num]
#     sleep(0)
#   }
# end

def output_spacer
  # puts "\n"
  # # 2.times {|i| puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~:>".colorize(:red)}
  2.times {|i| puts ColorizedString["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~:>"].colorize(:red)}
  #ColorizedString["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~:>"].colorize(:red)
end

def welcome_message
  message = "Welcome to the Virtual Horoscope Reader\n".colorize(:blue)
  slow_print(message)
  output_spacer
end

def commands_message
  message = "Enter 'commands' to see all available commands\n".colorize(:blue)
  slow_print(message)
  output_spacer
end

def log_in_prompt
  message = "Enter 'change user' to log in and then 'get horoscope' to see today's horoscope reading\n".colorize(:blue)
  slow_print(message)
end



#binding.pry
"wut"
