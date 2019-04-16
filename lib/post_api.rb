require 'pry'
require 'httparty'

class PostApi
  include HTTParty

  def self.horoscope_path
    'https://aztro.sameerkumar.website/'
  end

  def self.get_horoscopes
    today_horoscope = {}

    signs = ['aries', 'taurus', 'gemini', 'cancer', 'leo', 'virgo', 'libra', 'scorpio', 'sagittarius', 'capricorn', 'aquarius', 'pisces']

    signs.each { |sign_type|
      response = PostApi.post(PostApi.horoscope_path, query: { sign: sign_type, day: 'today'  })
      sign_key = sign_type.to_sym
      today_horoscope[sign_key] = response
    }

    today_horoscope
  end
end


#response = PostApi.post(PostApi.horoscope_path, query: { sign: 'virgo', day: 'today'  })
binding.pry

"wut"
