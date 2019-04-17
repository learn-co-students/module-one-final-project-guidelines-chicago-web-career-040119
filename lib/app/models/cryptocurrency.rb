class Cryptocurrency < ActiveRecord::Base
  has_many :transactions
  has_many :users, through: :transactions


  #USER STORY METHOD - returns cryptocurrency row that matches search name
  def self.search_by_name(name)
    formated_input = name.downcase.split.map{|word| word.capitalize}.join(" ")
    Cryptocurrency.find_by(name: formated_input) || "Please enter a viable search name."
  end

  #USER STORY METHOD - returns cryptocurrency row that matches search ticker
  def self.search_by_ticker(ticker)
    formated_input = ticker.upcase
    Cryptocurrency.find_by(ticker: formated_input) || "Please enter a viable search ticker."
  end
  #USER STORY METHOD - returns overall look at current market
  def self.market_view
    Cryptocurrency.select do |crypto|
      puts "#{crypto.name}: Price $#{crypto.usd.round(2)} | MarketCap #{(crypto.market_cap/1000000).round(1)} B | 24hrChange #{crypto.percent_change_24hr.round(2)}%"
    end
  end
  #USER STORY METHOD - returns overall look ordered by biggest gainers
  def self.market_view_by_24hr_gain
    Cryptocurrency.order(percent_change_24hr: :desc).select do |crypto|
      puts "#{crypto.name}: Price $#{crypto.usd.round(2)} | 24hrChange #{crypto.percent_change_24hr.round(2)}%"
    end
  end

end
