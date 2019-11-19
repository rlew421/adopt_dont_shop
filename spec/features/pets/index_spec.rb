require 'rails_helper'

RSpec.describe "pets index page" do
  describe "as a visitor" do
    it "I see each pet in the system including the pet's:
    - image
    - name
    - approximate age
    - sex
    - name of the shelter where the pet is currently located" do

      pet_1 = Pet.create(image: "https://scontent-den4-1.xx.fbcdn.net/v/t1.0-9/69959835_377201229643201_4012713976726028288_o.jpg?_nc_cat=109&_nc_oc=AQlSsxr7ocJQdJ_USDptWwC1yYaFJvmQcqU1h1os4Kf4OXE8xOGfJWdUvVwrGyxSXYQ&_nc_ht=scontent-den4-1.xx&oh=b38ee308df03b9d760c5e720905eda0b&oe=5E4D6B16",
                          name: 'Henri',
                          approximate_age: 5,
                          sex: 'Male',
                          current_shelter: 'Boulder Bulldog Rescue')

      pet_2 = Pet.create(image: "https://scontent-den4-1.xx.fbcdn.net/v/t31.0-8/14608760_10153942326162816_2748710450820779939_o.jpg?_nc_cat=100&_nc_oc=AQnrfoKEaHR6I5dtefDwT7AGx_jSyJbGEabXvtbS9jMf2eGvl4_plvsK3eSmKjECppM&_nc_ht=scontent-den4-1.xx&oh=358dd965255af229bdc5ea8bb5090fca&oe=5E4AA5BB",
                          name: 'Alfred',
                          approximate_age: 2,
                          sex: 'Male',
                          current_shelter: "Howlz 'n Jowlz")

      visit '/pets'
      
      expect(page).to have_css("img[src*='#{pet_1.image}']")
      expect(page).to have_content("Name: #{pet_1.name}")
      expect(page).to have_content("Age: #{pet_1.approximate_age}")
      expect(page).to have_content("Sex: #{pet_1.sex}")
      expect(page).to have_content("Current Shelter: #{pet_1.current_shelter}")

      expect(page).to have_css("img[src*='#{pet_2.image}']")
      expect(page).to have_content("Name: #{pet_2.name}")
      expect(page).to have_content("Age: #{pet_2.approximate_age}")
      expect(page).to have_content("Sex: #{pet_2.sex}")
      expect(page).to have_content("Current Shelter: #{pet_2.current_shelter}")
    end
  end
end
