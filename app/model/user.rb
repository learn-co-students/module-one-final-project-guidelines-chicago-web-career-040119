class User < ActiveRecord::Base
  has many :readings
  has many :horoscopes, through: :readings

  

end
