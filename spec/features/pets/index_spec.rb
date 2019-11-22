require 'rails_helper'

RSpec.describe "pets index page" do
  describe "as a visitor" do
    before(:each) do
      @boulder_bulldog_rescue = Shelter.create(name: "Boulder Bulldog Rescue", address: "2712 Slobber Circle", city: "Boulder", state: "CO", zip: 80205)
      @howlz_n_jowlz = Shelter.create(name: "Howlz 'n Jowlz", address: "7943 Furry Friend Drive", city: "Colorado Springs", state: "CO", zip: 80207)

      @henri = @boulder_bulldog_rescue.pets.create(image: "https://scontent-den4-1.xx.fbcdn.net/v/t1.0-9/69959835_377201229643201_4012713976726028288_o.jpg?_nc_cat=109&_nc_oc=AQlSsxr7ocJQdJ_USDptWwC1yYaFJvmQcqU1h1os4Kf4OXE8xOGfJWdUvVwrGyxSXYQ&_nc_ht=scontent-den4-1.xx&oh=b38ee308df03b9d760c5e720905eda0b&oe=5E4D6B16",
        name: 'Henri',
        description: "With his heartwarming wrinkles and furrowed brow, he'll slobber his way into your heart!",
        approximate_age: 5,
        sex: 'Male',
        current_shelter: 'Boulder Bulldog Rescue'
      )

      @alfred = @howlz_n_jowlz.pets.create(image: "https://scontent-den4-1.xx.fbcdn.net/v/t31.0-8/14608760_10153942326162816_2748710450820779939_o.jpg?_nc_cat=100&_nc_oc=AQnrfoKEaHR6I5dtefDwT7AGx_jSyJbGEabXvtbS9jMf2eGvl4_plvsK3eSmKjECppM&_nc_ht=scontent-den4-1.xx&oh=358dd965255af229bdc5ea8bb5090fca&oe=5E4AA5BB",
        name: 'Alfred',
        description: "Truly a beautiful wrinkly boi!",
        approximate_age: 2,
        sex: 'Male',
        current_shelter: "Howlz 'n Jowlz")

      visit '/pets'
    end

    it "I see each pet in the system including the pet's:
    - image
    - name
    - approximate age
    - sex
    - name of the shelter where the pet is currently located" do

      within "#pet-#{@henri.id}" do
        expect(page).to have_css("img[src*='#{@henri.image}']")
        expect(page).to have_content("Name: #{@henri.name}")
        expect(page).to have_content("Age: #{@henri.approximate_age}")
        expect(page).to have_content("Sex: #{@henri.sex}")
        expect(page).to have_content("Current Shelter: #{@henri.current_shelter}")
      end

      within "#pet-#{@alfred.id}" do
        expect(page).to have_css("img[src*='#{@alfred.image}']")
        expect(page).to have_content("Name: #{@alfred.name}")
        expect(page).to have_content("Age: #{@alfred.approximate_age}")
        expect(page).to have_content("Sex: #{@alfred.sex}")
        expect(page).to have_content("Current Shelter: #{@alfred.current_shelter}")
      end
    end

    it "I see an edit link next to each pet that allows me to edit that pet's information through the edit form" do
      within "#pet-#{@henri.id}" do
        expect(page).to have_link("Edit #{@henri.name}")
      end
      click_link "Edit #{@henri.name}"
      expect(current_path).to eq("/pets/#{@henri.id}/edit")

      visit '/pets'

      within "#pet-#{@alfred.id}" do
        expect(page).to have_link("Edit #{@alfred.name}")
      end
      click_link "Edit #{@alfred.name}"
      expect(current_path).to eq("/pets/#{@alfred.id}/edit")
    end

    it "I see a delete link next to each pet that allows me to delete that pet" do
      within "#pet-#{@henri.id}" do
        expect(page).to have_link("Delete #{@henri.name}")
      end
      click_link "Delete #{@henri.name}"
      expect(current_path).to eq("/pets")
      expect(page).to_not have_content(@henri.name)

      visit '/pets'

      within "#pet-#{@alfred.id}" do
        expect(page).to have_link("Delete #{@alfred.name}")
      end
      click_link "Delete #{@alfred.name}"
      expect(current_path).to eq("/pets")
      expect(page).to_not have_content(@alfred.name)
    end
  end
end
