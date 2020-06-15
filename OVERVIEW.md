Coin Market App
by Nick Moore and Jake Bartlow

OVERVIEW
The purpose of this app is perform an API call to coinmarketcap.com to retrieve the latest information on the top ten cryptocurrencies by market cap. The user can build a portfolio, add cryptocurrencies, and view portfolio balances.

STARTUP
To start, obtain a free API key from coinmarketcap.com
Create a new file in the top level folder called config.rb
In config.rb create a new class called APIKey
In the APIKey class, create a class method called self.api_key
In self.api_key paste your API key as a string
In the terminal run bundle install > rake db:migrate > rake start_app
