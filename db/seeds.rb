# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Creating apartments ..."
Apartment.destroy_all
User.destroy_all

userA = User.create(email: 'herro@apart.com', password: '123456', password_confirmation: '123456')
userB = User.create(email: 'woof@apart.com', password: '123456', password_confirmation: '123456')
userC = User.create(email: 'pug@apart.com', password: '123456', password_confirmation: '123456')
userD = User.create(email: 'meow@apart.com', password: '123456', password_confirmation: '123456')
userE = User.create(email: 'dcc@apart.com', password: '123456', password_confirmation: '123456')
userF = User.create(email: 'hello@apart.com', password: '123456', password_confirmation: '123456')

accomodation_type_array = ["entire apartment", "private room", "shared room"]
beds_array = (1..4).to_a
bedrooms_array = (1..3).to_a
bathrooms_array = (1..2).to_a
guests_array = (1..6).to_a
price_array = (15..50).to_a

equipmentA = %(kitchen shampoo heater)
equipmentB = %(kitchen wifi iron hairdryer)
equipmentC = %(breakfast family-friendly fireplace)
equipment_array = [equipmentA, equipmentB, equipmentC]

apartmentA = Apartment.new({
  title: "Room, 2 min to Alexa",
  accomodation_type: accomodation_type_array.sample,
  beds: beds_array.sample,
  bedrooms: bedrooms_array.sample,
  guests: guests_array.sample,
  equipment: equipment_array.sample,
  city: "Berlin",
  address: "Alexanderstraße 4, 10178 Berlin",
  price_per_night: price_array.sample,
  })
apartmentA.user = userA
apartmentA.save

apartmentB = Apartment.new({
  title: "Quiet room in Prenzlauer Berg",
  accomodation_type: accomodation_type_array.sample,
  beds: beds_array.sample,
  bedrooms: bedrooms_array.sample,
  guests: guests_array.sample,
  equipment: equipment_array.sample,
  city: "Berlin",
  address: "Kastanienallee 82, 10435 Berlin",
  price_per_night: price_array.sample,
  })
apartmentB.user = userB
apartmentB.save

apartmentC = Apartment.new({
  title: "Spacious & Cozy Room, Neukölln",
  accomodation_type: accomodation_type_array.sample,
  beds: beds_array.sample,
  bedrooms: bedrooms_array.sample,
  guests: guests_array.sample,
  equipment: equipment_array.sample,
  city: "Berlin",
  address: "Hermannstraße 10, 12049 Berlin",
  price_per_night: price_array.sample,
  })
apartmentC.user = userC
apartmentC.save

apartmentZ = Apartment.new({
  title: "Big room in Berlin Mitte",
  accomodation_type: accomodation_type_array.sample,
  beds: beds_array.sample,
  bedrooms: bedrooms_array.sample,
  guests: guests_array.sample,
  equipment: equipment_array.sample,
  city: "Berlin",
  address: "Max-Beer-Straße 7, 10119 Berlin",
  price_per_night: price_array.sample,
  })
apartmentZ.user = userA
apartmentZ.save

puts "Finished!"


