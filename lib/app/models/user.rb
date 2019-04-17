class User < ActiveRecord::Base
  has_many :transactions
  has_many :cryptocurrencies, through: :transactions


  #helper function to retrieve Transaction instances for User
  def transactions
    Transaction.where(user_id: self)
  end

  def coin_amounts
    return_hash = {}
    transactions.each do |transaction|
      coin_data = Cryptocurrency.find(transaction[:coin_id])
      if return_hash[coin_data.name]
        return_hash[coin_data.name] += transaction.quantity
      else
        return_hash[coin_data.name] = transaction.quantity
      end
    end
    return_hash
  end

  #helper function to sum qty of same cryto_ids
  def grouped_crypto_id_arr
    grouped_arr = crypto_id_arr.group_by {|g|g[:crypto_id]}.map {|_,a|{crypto_id: a.first[:crypto_id], qty: a.map {|g| g[:qty]}}}
    grouped_arr.map {|arr| {crypto_id: arr[:crypto_id], qty: arr[:qty].reduce(:+)} }
  end

  #helper function to retrieve coin_ids and quantity pairings
  def crypto_id_arr
    transactions.map {|transaction| {crypto_id: transaction.coin_id, qty: transaction.quantity}}
  end

  #Puts user's total portfolio by coin value in USD, along with total portfolio value in USD.
  def crypto_usd_value
    sum = 0
    puts "Your portfolio breakdown is as follows:"
    portfolio = grouped_crypto_id_arr.map do |crypto|
      crypto_data = Cryptocurrency.find(crypto[:crypto_id])
      sum += crypto_data.usd * crypto[:qty]
      puts "#{crypto_data.name}: $#{(crypto_data.usd * crypto[:qty]).round(2)}"
    end
    puts "Total Value: $#{sum.round(2)}"
  end

  #Puts user's total portfolio as Cryptocurrency, Price, Quantity
  def crypto_holdings
    puts "Your portfolio holdings are as follows:"
    portfolio = grouped_crypto_id_arr.map do |crypto|
      crypto_data = Cryptocurrency.find(crypto[:crypto_id])
      puts "Cryptocurrency: #{crypto_data.name} | Price: $#{crypto_data.usd.round(2)} | Quantity: #{crypto[:qty]}"
    end
  end

end
