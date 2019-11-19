require 'rails_helper'

RSpec.describe "when I visit a shelter show page" do
  it "I see a link to update the shelter" do
    shelter_1 = Shelter.create!(name: "Gimme Shelter", address: "5218 Rolling Stones Avenue", city: "Denver", state: "CO", zip: 80203)

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_link("Edit #{shelter_1.name}")
  end

  it "I can click on the link and fill out a form to edit the shelter's data including:
    - name
    - address
    - city
    - state
    - zip" do
    shelter_1 = Shelter.create!(name: "Gimme Shelter", address: "5218 Rolling Stones Avenue", city: "Denver", state: "CO", zip: 80203)

    visit "/shelters/#{shelter_1.id}"
    click_link "Edit #{shelter_1.name}"

    expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")
    fill_in :name, with: "Hey Bulldog"
    fill_in :address, with: "1969 Abbey Road"
    fill_in :city, with: "London"
    fill_in :state, with: "UK"
    fill_in :zip, with: "80205"
    click_button "Update #{shelter_1.name}"

    expect(current_path).to eq("/shelters/#{shelter_1.id}")
    expect(page).to have_content("Hey Bulldog")
    expect(page).to have_content("1969 Abbey Road")
    expect(page).to have_content("London")
    expect(page).to have_content("UK")
    expect(page).to have_content("80205")
  end
end
