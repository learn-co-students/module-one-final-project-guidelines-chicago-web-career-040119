require_relative "../lib/models/user"

50.times do
  name = Faker::GreekPhilosophers.name

  month = (1..12).to_a.sample.to_s
  day = (1..28).to_a.sample.to_s
  birthday = "#{month}/#{day}"

  sign = ['Aries', 'Taurus', 'Gemini', 'Cancer', 'Leo', 'Virgo', 'Libra', 'Scorpio', 'Sagittarius', 'Capricorn', 'Aquarius', 'Pisces'].sample

  User.create(name: name, birthday: birthday, sign: sign)
end
