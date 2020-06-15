class Transaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :cryptocurrency, foreign_key: "coin_id"
end
