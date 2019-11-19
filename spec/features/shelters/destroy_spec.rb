require 'rails_helper'

RSpec.describe "when I visit a shelter show page" do
  describe "as a visitor" do
    it "I see a link to delete the shelter that deletes the shelter" do
      shelter_1 = Shelter.create!(name: "Gimme Shelter", address: "5218 Rolling Stones Avenue", city: "Denver", state: "CO", zip: 80203)

      visit "/shelters/#{shelter_1.id}"
      click_link "Delete #{shelter_1.name}"

      expect(current_path).to eq('/shelters')
      expect(page).to_not have_content(shelter_1.name)
    end
  end
end
