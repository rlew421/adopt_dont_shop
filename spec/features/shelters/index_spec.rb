require 'rails_helper'

describe "shelter index page" do
  describe "as a visitor" do
    before :each do
      @shelter_1 = Shelter.create!(name: "Gimme Shelter", address: "5218 Rolling Stones Avenue", city: "Denver", state: "CO", zip: 80203)
      @shelter_2 = Shelter.create!(name: "Boulder Bulldog Rescue", address: "2712 Slobber Circle", city: "Boulder", state: "CO", zip: 80205)
      @shelter_3 = Shelter.create!(name: "Howlz 'n Jowlz", address: "7943 Furry Friend Drive", city: "Colorado Springs", state: "CO", zip: 80207)

      visit '/shelters'
    end
    it "I see the name of each shelter in the system" do

      expect(page).to have_content(@shelter_1.name)
      expect(page).to have_content(@shelter_2.name)
      expect(page).to have_content(@shelter_3.name)
    end

    it "I see an edit link next to each shelter that allows me to edit the shelter through the edit form" do
      within "#shelter-#{@shelter_1.id}" do
        expect(page).to have_link("Edit #{@shelter_1.name}")
      end
      click_link "Edit #{@shelter_1.name}"
      expect(current_path).to eq("/shelters/#{@shelter_1.id}/edit")
    end
  end
end
