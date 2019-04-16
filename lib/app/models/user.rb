class User < ActiveRecord::Base
  has_many :cryptocurrencies, through: :wallets
  has_many :wallets
end
