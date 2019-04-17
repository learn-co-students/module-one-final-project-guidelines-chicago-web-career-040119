PROMPT = TTY::Prompt.new


def welcome
  PROMPT.ask("Welcome to Coin Market App. What is your name?", default: ENV["User"])
end

def main_menu(user_name)
  PROMPT.select("Hi #{user_name}, what would you like to do today?", ["View Market", "View Wallet", "Exit"])
end

def market_menu
  PROMPT.select("Welcome to the Market Portal! Please select an option.",
    ["View Total Market", "View Total Market by 24hr Performance", "Main Menu"])
end

def wallet_menu
  PROMPT.select("Welcome to the Market Portal! Please select an option.",
    ["Create Wallet", "Buy Crypto", "Portfolio Overview", "Portfolio Worth", "Main Menu" ])
end

def buy_crypto
  name = get_coin_name
  quantity = get_coin_qty
  return_arr = [name, quantity]
end

def get_coin_name
  PROMPT.select("BUY SOMETHING WILL YA!",
    Cryptocurrency.crypto_names)
end

def get_coin_qty
  qty = PROMPT.ask('Please enter a numerical quantity.', default: ENV["0"]).to_f
  if qty != 0.0
    return qty
  else
    puts "\n"
    puts "\n"
    puts "\x1B[31mThat didn't seem to be a valid number!\e[0m"
    puts "\n"
    puts "\n"
    get_coin_qty
  end
end
