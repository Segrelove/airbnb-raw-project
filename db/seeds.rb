require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Reservation.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('reservations')
Listing.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('listings')
User.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')
City.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('cities')

20.times do |x|
  u = User.create(email: Faker::Internet.email, phone_number: "06#{rand(10000000..90000000)}", description: Faker::ChuckNorris.fact)
end

10.times do |x|
  c = City.create(name: Faker::Address.city, zip_code: "#{rand(0..9)}#{Faker::Number.number(4)}")    
end

50.times do |x|
  l = Listing.create(available_beds: rand(1..5), price: rand(40..1200), description: Faker::Company.bs, has_wifi: Faker::Boolean.boolean, welcome_message: "Welcome to my crib, MTV", city_id: rand(1..10), user_id: rand(1..20))
end

5.times do |x|
  Reservation.create(
    start_date: Faker::Date.forward(3), 
    end_date: Faker::Date.forward(6), 
    listing_id: rand(1..50), 
    user_id: rand(1..20) 
    )
end

5.times do |x|
  Reservation.create(
    start_date: Faker::Date.backward(10), 
    end_date: Faker::Date.backward(6), 
    listing_id: rand(1..50), 
    user_id: rand(1..20)
  )
end