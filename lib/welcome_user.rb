def slow_print(text)
  (0..text.length).each { |num|
    print text[num]
    sleep(0.04)
  }
end

def output_spacer
  # puts "\n"
  # # 2.times {|i| puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~:>".colorize(:red)}
  2.times {|i| puts ColorizedString["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~:>"].colorize(:red)}
  #ColorizedString["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~:>"].colorize(:red)
end

def welcome_message
  message = "Welcome to the Virtual Horoscope Reader\n"
  slow_print(message)
  output_spacer
end

def commands_message
  message = "Enter 'commands' to see all available commands\n"
  slow_print(message)
  output_spacer
end

def log_in_prompt
  message = "Enter your name to log in and get horoscope\n"
  slow_print(message)
  output_spacer
end



#binding.pry
"wut"
