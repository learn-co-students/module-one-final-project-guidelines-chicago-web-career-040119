class User < ActiveRecord::Base
  has_many :transactions
  has_many :cryptocurrencies, through: :transactions

  #Helper method that returns the crypto name and corresponding balance for user.
  def crypto_quantity
    return_hash = {}
    transactions.each do |transaction|
      coin_data = transaction.cryptocurrency
      if return_hash[coin_data.name]
        return_hash[coin_data.name] += transaction.quantity
      else
        return_hash[coin_data.name] = transaction.quantity
      end
    end
    return_hash
  end


  #Helper method to calculate total of each coin in user's wallets, returns array of hashes .
  def crypto_usd_values
    crypto_quantity.map {|name, qty| {name => Cryptocurrency.find_by(name: name).usd * qty}}
  end

  #USER STORY METHOD - puts out value of each crypto in USD, along with portfolio total in USD.
  def puts_crypto_usd_values
    crypto_usd_values.map {|hash| puts "#{hash.keys[0]}: $#{hash.values[0].round(2)}"}
    puts "Total: $#{crypto_usd_values.map {|s| s.values[0]}.reduce(0, :+).round(2)}"
  end

  #USER STORY METHOD - Puts user's total portfolio as Cryptocurrency, Price, Quantity
  def puts_portfolio_overview
    crypto_quantity.map {|name, qty| puts "#{name}: Price $#{Cryptocurrency.find_by(name: name).usd.round(2)} | Quantity #{qty}"}
  end

  #USER STORY METHOD - Puts name and 24 market change of user's cryptocurrency with highest gain.
  def puts_highest_crypto_gain
    highest_change = cryptocurrencies.maximum(:percent_change_24hr)
    crypto_name = Cryptocurrency.find_by(percent_change_24hr: highest_change).name
    puts "#{crypto_name}: #{highest_change.round(2)}%"
  end

  # #helper function to sum qty of same cryto_ids
  # def grouped_crypto_id_arr
  #   grouped_arr = crypto_id_arr.group_by {|g|g[:crypto_id]}.map {|_,a|{crypto_id: a.first[:crypto_id], qty: a.map {|g| g[:qty]}}}
  #   grouped_arr.map {|arr| {crypto_id: arr[:crypto_id], qty: arr[:qty].reduce(:+)} }
  # end

  #helper function to retrieve coin_ids and quantity pairings
  # def crypto_id_arr
  #   transactions.map {|transaction| {crypto_id: transaction.coin_id, qty: transaction.quantity}}
  # end

  #Puts user's total portfolio by coin value in USD, along with total portfolio value in USD.
  # def crypto_usd_value
  #   sum = 0
  #   puts "Your portfolio breakdown is as follows:"
  #   portfolio = grouped_crypto_id_arr.map do |crypto|
  #     crypto_data = Cryptocurrency.find(crypto[:crypto_id])
  #     sum += crypto_data.usd * crypto[:qty]
  #     puts "#{crypto_data.name}: $#{(crypto_data.usd * crypto[:qty]).round(2)}"
  #   end
  #   puts "Total Value: $#{sum.round(2)}"
  # end

  #USER STORY allows user to buy or sell crypto 
  def perform_transaction(name, quantity)
    crypto = Cryptocurrency.find_by(name: name)
    Transaction.create(user_id: self.id, coin_id: crypto.id, quantity:  quantity)
  end

end
