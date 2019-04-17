require_relative '../config/environment'

user_name = welcome
choice = main_menu(user_name)

# if choice == "View Market"
#   choice = market_menu
# end
#
# if choice =

while choice != "Exit"
  case choice
  when "View Market"
    choice = market_menu
  when "View Wallet"
    choice = wallet_menu
  when "Main Menu"
    choice = main_menu(user_name)
  when "View Total Market"
    puts "\n"
    Cryptocurrency.market_view
    puts "\n"
    choice = market_menu
  when "View Total Market by 24hr Performance"
    puts "\n"
    Cryptocurrency.market_view_by_24hr_gain
    puts "\n"
    choice = market_menu

  when "Create Wallet"
    if User.find_by(name: user_name)
      puts "\n"
      puts "\n"
      puts "\x1B[31mYou already have a wallet, #{user_name}!\e[0m"
      puts "\n"
      puts "\n"
    else
      User.create(name: user_name)
      puts "\n"
      puts "\n"
      puts "\x1B[32mWallet created successfully!\e[0m"
      puts "\n"
      puts "\n"
    end
    choice = wallet_menu

  when "Buy Crypto"
    if !User.find_by(name: user_name)
      puts "\n"
      puts "\n"
      puts "\x1B[31mPlease create a wallet first, #{user_name}.\e[0m"
      puts "\n"
      puts "\n"
      choice = wallet_menu
    else
      puts "\n"
      puts "\n"
      crypto_arr = buy_crypto
      User.find_by(name: user_name).perform_transaction(crypto_arr[0], crypto_arr[1])
      puts "\n"
      puts "\n"
      puts "\x1B[32m#{crypto_arr[1]} #{crypto_arr[0]} purchased successfully!\e[0m"
      puts "\n"
      puts "\n"
      choice = wallet_menu
    end

  when "Portfolio Overview"
    puts "\n"
    puts "\n"
    puts "\e[4mBelow is your total portfolio:\e[0m"
    puts "\n"
    User.find_by(name: user_name).puts_portfolio_overview
    puts "\n"
    puts "\n"
    choice = wallet_menu

  when "Portfolio Worth"
    puts "\n"
    puts "\n"
    puts "\e[4mBelow is your portfolio worth:\e[0m"
    puts "\n"
    User.find_by(name: user_name).puts_crypto_usd_values
    puts "\n"
    puts "\n"
    choice = wallet_menu

  when "Exit"
    choice = "Exit"
  end
end

puts "\n"
puts "\n"
puts "\e[1mThanks for using Coin Market App! Goodbye.\e[0m"
puts "\n"
puts "\n"

# binding.pry
#
# puts "HELLO WORLD"
