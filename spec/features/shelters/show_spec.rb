require 'rails_helper'

RSpec.describe "shelter show page" do
  describe "as a visitor" do
    it "I see the shelter with that id including the shelter's:
      - name
      - address
      - city
      - state
      - zip" do

      shelter_1 = Shelter.create!(name: "Gimme Shelter", address: "5218 Rolling Stones Avenue", city: "Denver", state: "CO", zip: 80203)

      visit "/shelters/#{shelter_1.id}"

      expect(page).to have_content(shelter_1.name)
      expect(page).to have_content(shelter_1.address)
      expect(page).to have_content(shelter_1.city)
      expect(page).to have_content(shelter_1.state)
      expect(page).to have_content(shelter_1.zip)
    end
  end
end
