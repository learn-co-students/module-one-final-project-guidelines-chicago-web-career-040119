def get_my_horoscope
  #binding.pry
  current_user = User.find_by name: @current_username
  #binding.pry
  current_user_id = current_user.id
  #binding.pry
  #Horoscope.where(sign: 'aquarius').last

  #BESTTTTT
  latest_horoscope = Horoscope.where("sign = :sign", { sign: current_user.sign.downcase}).last

  latest_horoscope_id = latest_horoscope.id

  my_reading = Reading.create(user_id: current_user_id, horoscope_id: latest_horoscope_id)

  message = my_reading.horoscope.description + "\n"
  slow_print(message.colorize(:blue))
  #binding.pry
end
