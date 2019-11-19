# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Shelters
shelter_1 = Shelter.create!(name: "Gimme Shelter", address: "5218 Rolling Stones Avenue", city: "Denver", state: "CO", zip: 80203)
shelter_2 = Shelter.create!(name: "Boulder Bulldog Rescue", address: "2712 Slobber Circle", city: "Boulder", state: "CO", zip: 80205)
shelter_3 = Shelter.create!(name: "Howlz 'n Jowlz", address: "7943 Furry Friend Drive", city: "Colorado Springs", state: "CO", zip: 80207)
