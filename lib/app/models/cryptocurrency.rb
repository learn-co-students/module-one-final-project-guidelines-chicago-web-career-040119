class Cryptocurrency < ActiveRecord::Base
  has_many :transactions
  has_many :users, through: :transactions



  def self.search_by_name(name)
    formated_input = name.downcase.split.map{|word| word.capitalize}.join(" ")
    Cryptocurrency.find_by(name: formated_input)
  end

  def self.search_by_ticker(ticker)
    formated_input = ticker.upcase
    Cryptocurrency.find_by(ticker: formated_input)
  end


end
