# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Shelters
boulder_bulldog_rescue = Shelter.create(name: "Boulder Bulldog Rescue", address: "2712 Slobber Circle", city: "Boulder", state: "CO", zip: 80205)
howlz_n_jowlz = Shelter.create(name: "Howlz 'n Jowlz", address: "7943 Furry Friend Drive", city: "Colorado Springs", state: "CO", zip: 80207)

# Pets
harry = boulder_bulldog_rescue.pets.create(image: "https://i.pinimg.com/564x/aa/38/27/aa38272dbdb0b6ee03c17420b7de3c2c.jpg",
  name: 'Harry',
  description: "Underbite for days.",
  approximate_age: 6,
  sex: 'Male',
  adoptable?: false)

tater_tot = boulder_bulldog_rescue.pets.create(image: "https://i.pinimg.com/564x/ac/4c/3f/ac4c3f848136a5f59b973943c113723f.jpg",
    name: 'Tater Tot',
    description: "The cutest potato!",
    approximate_age: 8,
    sex: 'Male',
    adoptable?: false)
    
henri = boulder_bulldog_rescue.pets.create(image: "https://scontent-den4-1.xx.fbcdn.net/v/t1.0-9/69959835_377201229643201_4012713976726028288_o.jpg?_nc_cat=109&_nc_oc=AQlSsxr7ocJQdJ_USDptWwC1yYaFJvmQcqU1h1os4Kf4OXE8xOGfJWdUvVwrGyxSXYQ&_nc_ht=scontent-den4-1.xx&oh=b38ee308df03b9d760c5e720905eda0b&oe=5E4D6B16",
                    name: 'Henri',
                    description: "With his heartwarming wrinkles and furrowed brow, he'll slobber his way into your heart!",
                    approximate_age: 5,
                    sex: 'Male')

alfred = howlz_n_jowlz.pets.create(image: "https://scontent-den4-1.xx.fbcdn.net/v/t31.0-8/14608760_10153942326162816_2748710450820779939_o.jpg?_nc_cat=100&_nc_oc=AQnrfoKEaHR6I5dtefDwT7AGx_jSyJbGEabXvtbS9jMf2eGvl4_plvsK3eSmKjECppM&_nc_ht=scontent-den4-1.xx&oh=358dd965255af229bdc5ea8bb5090fca&oe=5E4AA5BB",
                    name: 'Alfred',
                    description: "Truly a beautiful wrinkly boi!",
                    approximate_age: 2,
                    sex: 'Male')

toast = boulder_bulldog_rescue.pets.create(image: "https://i.pinimg.com/564x/4b/0c/99/4b0c99ace72fdfc65b2853fa14d41a8b.jpg",
                    name: 'Toast',
                    description: "She snorts, she farts, she's sweeter than French toast!",
                    approximate_age: 4,
                    sex: 'Female')
