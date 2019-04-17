require_relative "../config/environment"
require_relative "./models/horoscope"

module PostApi
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

def add_horoscopes_to_database
  if check_horoscope_done_today == false
    todays_horoscope = PostApi.get_horoscopes

    todays_horoscope.each {|keyz, valz|
      attributes = {}
      valz.each {|h_key, data|
        attributes[h_key.to_sym] = data
        #binding.pry
      }
      attributes[:sign] = keyz.to_s
      #binding.pry
      new_horoscope = Horoscope.create(attributes)
      new_horoscope.save
      #binding.pry
    }
  else
    message = "Horoscopes from today already downloaded from THE COSMOS\n".colorize(:blue)
    slow_print(message)
    output_spacer
  end

end

def check_horoscope_done_today
  # if user has never run this program, return false to populate db
  if Horoscope.all.count != 0
    latest_horoscope_time = Horoscope.last.current_date
    latest_horoscope_time_array = latest_horoscope_time.to_a[3..5]
    current_time_array = Time.now.to_a[3..5]

    current_time_array == latest_horoscope_time_array
  else
    return false
  end
end

# def can_be_created_with_a_hash_of_attributes
#   # Initialize movie and then and save it
#   attributes = {
#       title: "The Sting",
#       release_date: 1973,
#       director: "George Roy Hill",
#       lead: "Paul Newman",
#       in_theaters: false
#   }
#   movie = Movie.create(attributes)
# end

#response = PostApi.post(PostApi.horoscope_path, query: { sign: 'virgo', day: 'today'  })
#binding.pry

"wut"
