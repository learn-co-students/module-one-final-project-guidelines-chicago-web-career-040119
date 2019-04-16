class Wallet < ActiveRecord::Base
  belongs_to :user
  belongs_to :cryptocurrency
end
