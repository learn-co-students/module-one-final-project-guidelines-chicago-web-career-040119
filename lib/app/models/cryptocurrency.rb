class Cryptocurrency < ActiveRecord::Base
  has_many :users, through: :wallets
  has_many :wallets
end
