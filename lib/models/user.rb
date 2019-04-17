class User < ActiveRecord::Base
  has_many :readings
  has_many :horoscopes, through: :readings



end
