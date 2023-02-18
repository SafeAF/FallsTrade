# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

u = User.new
u.email = "frodo@example.com"
u.password = 'password'
u.password_confirmation = 'password'
u.username = "Frodo Baggins"
u.bio = Faker::Lorem.paragraph(sentence_count: 3)
u.save!

u2 = User.new
u2.email = "bilbo@example.com"
u2.password = 'password'
u2.password_confirmation = 'password'
u2.username = "boobar"
u2.bio = Faker::Lorem.paragraph(sentence_count: 3)
u2.save!

u3 = User.new
u3.email = "foo@foo.com"
u3.password = 'foobar'
u3.password_confirmation = 'foobar'
u3.username = "foobar"
u3.bio = Faker::Lorem.paragraph(sentence_count: 3)
u3.is_moderator = true
u3.is_administrator = true
u3.save!

# adding images to listing
#@message.image.attach(io: File.open('/path/to/file'), filename: 'file.pdf')
(1..10).each do |list|
list = Listing.new
list.title = Faker::Lorem.sentence(word_count: 5)
list.description = Faker::Lorem.sentence(word_count: 15)
list.user = User.first
list.category = "Agricultural"
list.location = Faker::Address.city
list.price = rand(1..100.0)
list.pictures.attach(io: File.open('/home/sam/images/Camera/20220128_123608.jpg'), filename: '20220128_123608.jpg')
list.save!
end
#  l1 = Listing.create(
#   title: "Battleship",
#   category: "Equipment",
#   description: Faker::Lorem.sentence(word_count: 15),
#   location: "Pirate Bay",
#   price: "23000.00",
#   user: User.first
# )
#
#
# l1.image.attach(io: File.open('/home/sam/images/Camera/20220128_123608.jpg'), filename: '20220128_123608.jpg')
# l1.save
#
# u.listings << Listing.create(
#   title: "Diesel Exhaust Fluid",
#   category: "Consumables",
#   description: Faker::Lorem.sentence(word_count: 7),
#   location: "Washington DC",
#   price: "4.50"
# )
#
# u.listings << Listing.create(
#   title: "Used Car",
#   category: "Consumables",
#   description: Faker::Lorem.sentence(word_count: 7),
#   location: "Twin",
#   price: "200000.00"
# )
#
# u.save!
#
#
# u2 = User.last
#
# u2.listings << Listing.create(
#   title: "Muffler Bearings",
#   category: "Equipment",
#   description: Faker::Lorem.sentence(word_count: 10),
#   location: "Hornswaggle",
#   price: "15.00"
# )
#
# u2.listings << Listing.create(
#   title: "Horse Butt Nuggets",
#   category: "Agricultural",
#   description: Faker::Lorem.sentence(word_count: 5),
#   location: "Backyard",
#   price: "10.00"
# )
#
# u2.listings << Listing.create(
#   title: "Chicken Eggs",
#   category: "Agricultural",
#   description: Faker::Lorem.sentence(word_count: 20),
#   location: "Backyard",
#   price: "200.00"
# )
#
# u2.save!
