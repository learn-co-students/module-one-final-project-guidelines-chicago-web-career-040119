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


end
