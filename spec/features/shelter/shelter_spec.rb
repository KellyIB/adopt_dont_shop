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
    @shelter_6 = Shelter.create(name:     "Pretty Good Pets",
                                address:  "87 Lower Expectations St.",
                                city:     "Mediocre",
                                state:    "Maine",
                                zip:      "04005")
    @pet_1 = Pet.create(name:  "Zelda",
                        image: "https://i.ytimg.com/vi/3dcli9i_pvA/hqdefault.jpg",
                        description: "Golden Retriever with a great smile.",
                        approximate_age:  2,
                        sex:    "Female",
                        adoption_status: "available",
                        shelter_id: "#{@shelter_1.id}")
    @pet_2 = Pet.create(name:  "Taylor",
                        image: "https://i.barkpost.com/wp-content/uploads/2015/10/reddit-dog-jokes-20.jpg?q=70&fit=crop&crop=entropy&w=808&h=808",
                        description: "Chocolate Lab Mix. Loves Cake.",
                        approximate_age:  4,
                        sex:    "Female",
                        adoption_status: "available",
                        shelter_id: "#{@shelter_3.id}")
    @pet_3 = Pet.create(name:  "Pac Man",
                        image: "https://www.australian-shepherd-lovers.com/image-files/dog-chewing.jpg",
                        description: "Australian Shephard.  Has mild separation anxiety.  May need to be crated when alone.",
                        approximate_age:  4,
                        sex:    "Male",
                        adoption_status: "available",
                        shelter_id: "#{@shelter_4.id}")
    @pet_4 = Pet.create(name:  "Goofy",
                        image: "https://static.boredpanda.com/blog/wp-content/uploads/2016/09/dogs-catching-treats-fotos-frei-schnauze-christian-vieler-66-57e8d9d0ec7ee__880.jpg",
                        description: "Hound Mix. Well trained in basic commands. Will catch treats when thrown.",
                        approximate_age:  5,
                        sex:    "Male",
                        adoption_status: "adoption pending",
                        shelter_id: "#{@shelter_1.id}")
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
    click_link('Shelter Index')
    expect(current_path).to eq('/shelters')
  end

  it "can see all the pets available at a shelter" do
    visit "/shelters/#{@shelter_1.id}"
    click_link('Pets')
    expect(current_path).to eq("/shelters/#{@shelter_1.id}/pets")
    expect(page).to have_css("img[src*='#{@pet_1.image}']")
    expect(page).to have_content(@pet_1.name)
    expect(page).to have_content(@pet_1.approximate_age)
    expect(page).to have_content(@pet_1.description)
    expect(page).to have_content(@pet_1.sex)
    expect(page).to have_content(@pet_1.adoption_status)
    expect(page).to have_css("img[src*='#{@pet_4.image}']")
    expect(page).to have_content(@pet_4.name)
    expect(page).to have_content(@pet_4.approximate_age)
    expect(page).to have_content(@pet_4.description)
    expect(page).to have_content(@pet_4.sex)
    expect(page).to have_content(@pet_4.adoption_status)
end

  it "can update an existing shelter" do
    visit "/shelters/#{@shelter_1.id}"
    click_link('Update Shelter')
    expect(current_path).to eq("/shelters/#{@shelter_1.id}/edit")
    fill_in :name, with: "Bob's Barkers"
    fill_in :address, with: "1972 Wazza Street"
    fill_in :city, with: "Los Angeles"
    fill_in :state, with: "California"
    fill_in :zip, with: "90005"
    click_on 'Update Shelter'
    expect(current_path).to eq('/shelters')
    expect(page).to have_content("Bob's Barkers")
    expect(page).not_to have_content("Older Angels")
  end

  it "can delete an existing shelter page" do
    visit "/shelters"
    visit "/shelters/#{@shelter_6.id}"
    click_button 'Delete Shelter'
    expect(current_path).to eq('/shelters')
    expect(page).to_not have_content(@shelter_6.name)
    expect(page).to have_content(@shelter_1.name)
    expect(page).to have_content(@shelter_2.name)
    expect(page).to have_content(@shelter_3.name)
    expect(page).to have_content(@shelter_4.name)
    expect(page).to have_content(@shelter_5.name)
  end

  it "can create a new shelter" do
    visit '/shelters'
    click_link('New Shelter')
    expect(current_path).to eq('/shelters/new')
    fill_in :name, with: "Bob's Barkers"
    fill_in :address, with: "1972 Wazza Street"
    fill_in :city, with: "Los Angeles"
    fill_in :state, with: "California"
    fill_in :zip, with: "90005"
    click_on 'Create Shelter'
    expect(current_path).to eq('/shelters')
    expect(page).to have_content("Bob's Barkers")
  end

  it "can create a new pet" do
    visit "/shelters/#{@shelter_1.id}/pets"
    click_link('Create Pet')
    expect(current_path).to eq("/shelters/#{@shelter_1.id}/pets/new")
    fill_in :name, with: "Pete"
    fill_in :image, with: "https://static.boredpanda.com/blog/wp-content/uploads/2016/09/dogs-catching-treats-fotos-frei-schnauze-christian-vieler-66-57e8d9d0ec7ee__880.jpg"
    fill_in :description, with: "Basset Hound. Likes to lay around and mope.  Hates Cats"
    fill_in :approximate_age, with: "7"
    fill_in :sex, with: "Male"
    click_on 'Create Pet'
    expect(current_path).to eq("/shelters/#{@shelter_1.id}/pets")
    expect(page).to have_content("Pete")
  end

  it "can have a valid link for update shelter from the index page" do
    visit '/shelters'
    click_link('Update Shelter', match: :first)
    expect(current_path).to eq("/shelters/#{@shelter_1.id}/edit")
  end

  it "can have a valid link for delete shelter from the index page" do
    visit '/shelters'
    click_link('Delete Shelter', match: :first)
    expect(current_path).to eq("/shelters")
    expect(page).to_not have_content(@shelter_1.name)
  end

  it "can have a valid link for update pet from the shelters/pets index page" do
    visit "/shelters/#{@shelter_1.id}/pets"
    click_link('Update Pet', match: :first)
    expect(current_path).to eq("/pets/#{@pet_1.id}/edit")
  end

  it "can delete a pet from the shelters/pets index page" do
    visit "/shelters/#{@shelter_1.id}/pets"
    click_link('Delete Pet', match: :first)
    expect(current_path).to eq("/pets")
    expect(page).not_to have_content("Zelda")
  end

  it "can have a valid show link for every shelter name" do
    visit "/pets"
    click_link("#{@shelter_1.name}", match: :first)
    expect(current_path).to eq("/shelters/#{@shelter_1.id}")
    visit "/pets/#{@pet_1.id}"
    click_link("#{@shelter_1.name}", match: :first)
    expect(current_path).to eq("/shelters/#{@shelter_1.id}")
  end

  it "can have a valid shelter pets link for every shelter show page" do
    visit "/shelters/#{@shelter_1.id}"
    click_link("Pets")
    expect(current_path).to eq("/shelters/#{@shelter_1.id}/pets")
  end

  it "can have a valid shelters link for every page" do
    visit "/shelters/#{@shelter_1.id}/pets"
    click_link("Shelter Index")
    expect(current_path).to eq("/shelters")
    visit "/pets/#{@pet_3.id}"
    click_link("Shelter Index")
    expect(current_path).to eq("/shelters")
    visit "/shelters/#{@shelter_2.id}"
    click_link("Shelter Index")
    expect(current_path).to eq("/shelters")
    visit "/pets"
    click_link("Shelter Index")
    expect(current_path).to eq("/shelters")
    visit "/pets/#{@pet_1.id}/edit"
    click_link("Shelter Index")
    expect(current_path).to eq("/shelters")
    visit "/shelters/#{@shelter_2.id}/edit"
    click_link("Shelter Index")
    expect(current_path).to eq("/shelters")
    visit "/shelters/new"
    click_link("Shelter Index")
    expect(current_path).to eq("/shelters")
  end
end
