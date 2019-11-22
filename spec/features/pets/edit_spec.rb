require 'rails_helper'

RSpec.describe "when I visit a pet show page" do
  it "I can click a link that navigates to a form to edit the pet's data including:
  - image
  - name
  - description
  - approximate age
  - sex" do

    boulder_bulldog_rescue = Shelter.create!(name: "Boulder Bulldog Rescue", address: "2712 Slobber Circle", city: "Boulder", state: "CO", zip: 80205)
    henri = boulder_bulldog_rescue.pets.create!(image: "https://scontent-den4-1.xx.fbcdn.net/v/t1.0-9/69959835_377201229643201_4012713976726028288_o.jpg?_nc_cat=109&_nc_oc=AQlSsxr7ocJQdJ_USDptWwC1yYaFJvmQcqU1h1os4Kf4OXE8xOGfJWdUvVwrGyxSXYQ&_nc_ht=scontent-den4-1.xx&oh=b38ee308df03b9d760c5e720905eda0b&oe=5E4D6B16",
                        name: 'Henri',
                        description: "With his heartwarming wrinkles and furrowed brow, he'll slobber his way into your heart!",
                        approximate_age: 5,
                        sex: 'Male',
                        current_shelter: 'Boulder Bulldog Rescue')

    visit "/pets/#{henri.id}"
    click_link "Edit #{henri.name}"

    expect(current_path).to eq("/pets/#{henri.id}/edit")

    image = "https://i.pinimg.com/564x/4d/62/b3/4d62b31fe8fc406ef669d6e33cad423f.jpg"
    name = "Porkchop"
    description = "Porkchop, a recent surrender, is ready to be your movie watching companion!"
    approximate_age = 2
    sex = "Female"

    fill_in :image, with: image
    fill_in :name, with: name
    fill_in :description, with: description
    fill_in :approximate_age, with: approximate_age
    fill_in :sex, with: sex
    click_button "Update Pet"

    edited_pet = Pet.last

    expect(current_path).to eq("/pets/#{henri.id}")
    expect(page).to have_css("img[src*='#{edited_pet.image}']")
    expect(page).to have_content(edited_pet.name)
    expect(page).to have_content(edited_pet.description)
    expect(page).to have_content(edited_pet.approximate_age)
    expect(page).to have_content(edited_pet.sex)
  end
end