class Horoscope < ActiveRecord::Base
  has_many :readings
end
