require_relative '../lib/api_communicator.rb'

20.times do User.create(name: Faker::Name.name)
end

20.times do Wallet.create(user_id: rand(1..20), coin_id: rand(1..10), quantity: rand(1..50))
end

data_hash = APICall.get_data

10.times do |i|
  data_block = data_hash["data"][i]
  Cryptocurrency.create(
    ticker:  data_block["symbol"],
    name:  data_block["name"],
    usd: data_block["quote"]["USD"]["price"],
    percent_change_24hr: data_block["quote"]["USD"]["percent_change_24h"],
    market_cap: data_block["quote"]["USD"]["market_cap"]
  )
end
