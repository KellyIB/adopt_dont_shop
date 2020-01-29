require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  before :each do
    @shelter_1 = Shelter.create(name:     "Older Angels",
                                address:  "32 S. Moving Street",
                                city:     "Silver Springs",
                                state:    "Colorado",
                                zip:      "80302")
    @shelter_2 = Shelter.create(name:     "Chewy's",
                                address:  "396 Petsy Road",
                                city:     "Phoenix",
                                state:    "Arizona",
                                zip:      "85004")
    @shelter_3 = Shelter.create(name:     "Second Chances",
                                address:  "873 Filmore Ave.",
                                city:     "Colorado Springs",
                                state:    "Colorado",
                                zip:      "80915")
    @shelter_4 = Shelter.create(name:     "Feline Friends",
                                address:  "123 Pickme Road",
                                city:     "Phoenix",
                                state:    "Arizona",
                                zip:      "85016")
    @shelter_5 = Shelter.create(name:     "Good Dogs",
                                address:  "4976 Best Friends Ave.",
                                city:     "Seattle",
                                state:    "Washington",
                                zip:      "98016")
  end

  it "can see all shelters in the system" do
    visit '/shelters'
    expect(page).to have_content(@shelter_1.name)
    expect(page).to have_content(@shelter_2.name)
    expect(page).to have_content(@shelter_3.name)
    expect(page).to have_content(@shelter_4.name)
    expect(page).to have_content(@shelter_5.name)
  end

  it "can see see one shelter's information" do
    visit "/shelters/#{@shelter_1.id}"
    expect(page).to have_content(@shelter_1.name)
    expect(page).to have_content(@shelter_1.address)
    expect(page).to have_content(@shelter_1.city)
    expect(page).to have_content(@shelter_1.state)
    expect(page).to have_content(@shelter_1.zip)
    expect(page).not_to have_content(@shelter_2.name)
  end

end
