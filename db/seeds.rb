# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require "open-uri"

images = ["https://tetu.com/wp-content/uploads/2022/05/03.23_RPDR8694.jpg","https://tetu.com/wp-content/uploads/2022/05/03.23_RPDR8405.jpg","https://tetu.com/wp-content/uploads/2022/05/03.23_RPDR7098.jpg", "https://broncolor.swiss/assets/img/Gennext/Justin-Bettman/Drag-Queens/_contentWithShareBar23/JUSTIN-BETTMAN-DRAG-QUEENS-1.jpg", "https://tetu.com/wp-content/uploads/2022/05/03.23_RPDR8109.jpg", "https://tetu.com/wp-content/uploads/2022/05/03.23_RPDR7889.jpg", "https://broncolor.swiss/assets/img/Gennext/Justin-Bettman/Drag-Queens/_contentWithShareBar23/JUSTIN-BETTMAN-DRAG-QUEENS-3.jpg", "https://broncolor.swiss/assets/img/Gennext/Justin-Bettman/Drag-Queens/_contentWithShareBar23/JUSTIN-BETTMAN-DRAG-QUEENS-5.jpg", "https://tetu.com/wp-content/uploads/2022/05/03.23_RPDR0724.jpg", "https://tetu.com/wp-content/uploads/2022/05/03.23_RPDR7796.jpg", "https://tetu.com/wp-content/uploads/2022/05/03.23_RPDR6806.jpg", "https://broncolor.swiss/assets/img/Gennext/Justin-Bettman/Drag-Queens/_contentWithShareBar23/JUSTIN-BETTMAN-DRAG-QUEENS-7.jpg", "https://broncolor.swiss/assets/img/Gennext/Justin-Bettman/Drag-Queens/_contentWithShareBar23/JUSTIN-BETTMAN-DRAG-QUEENS-8.jpg", "https://tetu.com/wp-content/uploads/2022/05/RPDR_Kam_8427.jpg", "https://tetu.com/wp-content/uploads/2022/05/03.23_RPDR7603.jpg"]

puts "Cleaning database..."

Drag.destroy_all
User.destroy_all
10.times do
  puts "creating a user..."
  user = User.new
  user.first_name = Faker::Name.male_first_name
  user.last_name = Faker::Name.last_name
  user.email = "#{user.first_name}#{user.last_name}@gmail.com"
  user.password = "password"
  user.save!
  puts "user created"

  puts "creating a drag queen..."
  drag = Drag.new
  drag.user = user
  drag.nickname = Faker::FunnyName.two_word_name
  drag.city = Faker::Address.city
  drag.radius = rand(5..100)
  drag.specialty = ["singing", "dancing", "comedy", "doppelganger", "acrobatics", "bingo"].sample
  drag.hourly_rate = rand(60..300)
  drag.description = Faker::TvShows::BigBangTheory.quote
  puts "generating a picture for #{drag.nickname}..."
  file = URI.open(images.sample)
  drag.photo.attach(io: file, filename: "drag.png", content_type: "image/png")
  puts "Attributing a user"
  drag.user = user
  puts "Saving the user"
  drag.save!
  puts "#{drag.nickname} is created"
end
puts "10 BEAUTIFULS DRAGS CREATED"


# Faker::LoremFlickr.image(search_terms: ['drag_queen'])
