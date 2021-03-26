# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

%i[admin customer].each do |role|
  Role.create(name: role)
end

User.create!(email: 'admin@movieapp.com', password: 123456, password_confirmation: 123456, role_id: Role.find_by(name: 'admin').id)

movies_array = [
  { name: 'blackpanther', description: 'it is an action movie' },
  { name: 'jumanji', description: 'it is an adventure movie' },
  { name: 'rampage', description: 'it is a fiction' },
  { name: 'conjuring', description: 'it is a horror movie' },
  { name: 'mulan', description: 'it is a fight related' },
  { name: 'interstellar', description: 'it is a science fiction' }
]

movies_array.each do |movie_hash|
  image = "#{movie_hash[:name]}.jpeg"
  uploader = ImageUploader.new(:store)
  file = File.new(open("#{Rails.root}/app/assets/images/#{image}"))
  uploaded_file = uploader.upload(file)
  Movie.create!(name: movie_hash[:name], description: movie_hash[:description], image_data: uploaded_file.to_json)
end

['12-3', '3-6', '6-9', '9-12'].each do |slot|
  Slot.create!(time: slot)
end

['27-03-2021', '28-03-2021', '29-03-2021', '20-03-2021'].each do |date|
  MovieDate.create!(date: date)
end

[:screen1, :screen2, :screen3, :screen4].each do |screen|
  screen = Screen.create!(name: screen)
  {A1: 100, A2: 100, A3: 100, A4: 100, B1: 100, B2: 100, B3: 100, B4: 100, C1: 200, C2: 200, C3: 200, C4: 200, D1: 200, D2: 200, D3: 200, D4: 200}.each do |seat_number, price|
    seat = Seat.create!(number: seat_number)
    ScreensSeat.create!(screen_id: screen.id, seat_id: seat.id, price: price)
  end
end

Movie.all.each do |movie|
  [1, 2, 3, 4].each do |screen_id|
    screen = Screen.find(screen_id)
    [1, 2, 3, 4].each do |slot_id|
      slot = Slot.find(slot_id)
      [1, 2, 3, 4].each do |movie_date_id|
        movie_date = MovieDate.find(movie_date_id)
        ShowTime.create!(movie_id: movie.id, screen_id: screen.id, slot_id: slot.id, movie_date_id: movie_date.id)
      end
    end
  end
end




