# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require "open-uri"

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
  puts "generating a picture for #{drag.nickname}..."
  file = URI.open(Faker::LoremFlickr.image(size: "100x100", search_terms: ['drag-queen']))
  drag.photo.attach(io: file, filename: "drag.png", content_type: "image/png")
  puts "Attributing a user"
  drag.user = user
  puts "Saving the user"
  drag.save!
  puts "#{drag.nickname} is created"
end
puts "10 beautiful drags created"
