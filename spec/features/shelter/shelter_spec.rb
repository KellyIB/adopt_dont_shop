require 'rails_helper'

RSpec.describe "shelter index page", type: :feature do
  it "can see all shelters in the system" do
    shelter_1 = Shelter.create(name:     "Older Angels",
                                address:  "32 S. Moving Street",
                                city:     "Silver Springs",
                                state:    "Colorado",
                                zip:      "80302")
    shelter_2 = Shelter.create(name:     "Chewy's",
                                address:  "396 Petsy Road",
                                city:     "Phoenix",
                                state:    "Arizona",
                                zip:      "85004")
    shelter_3 = Shelter.create(name:     "Second Chances",
                                address:  "873 Filmore Ave.",
                                city:     "Colorado Springs",
                                state:    "Colorado",
                                zip:      "80915")
    shelter_4 = Shelter.create(name:     "Feline Friends",
                                address:  "123 Pickme Road",
                                city:     "Phoenix",
                                state:    "Arizona",
                                zip:      "85016")
    shelter_5 = Shelter.create(name:     "Good Dogs",
                                address:  "4976 Best Friends Ave.",
                                city:     "Seattle",
                                state:    "Washington",
                                zip:      "98016")
    visit '/shelters'

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
    expect(page).to have_content(shelter_3.name)
    expect(page).to have_content(shelter_4.name)
    expect(page).to have_content(shelter_5.name)
  end
end
