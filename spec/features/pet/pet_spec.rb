require 'rails_helper'

RSpec.describe "Pet index page", type: :feature do
  before :each do
    @shelter_1 = Shelter.create(name:     "Bob's Barkers",
                                address:  "32 Decibel Street",
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
    @shelter_4 = Shelter.create(name:     "Pretty Good Pets",
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
                        shelter_id: "#{@shelter_2.id}")
    # @pet_1 = Pet.create(name:  "Zelda",
    #                     image: "https://i.ytimg.com/vi/3dcli9i_pvA/hqdefault.jpg",
    #                     description: "Golden Retriever with a great smile.",
    #                     approximate_age:  2,
    #                     sex:    "Female",
    #                     adoption_status: "available",
    #                     shelter_id: "#{@shelter_2.id}")
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
    # @pet_3 = Pet.create(name:  "Pac Man",
    #                     image: "https://www.australian-shepherd-lovers.com/image-files/dog-chewing.jpg",
    #                     description: "Australian Shephard.  Has mild separation anxiety.  May need to be crated when alone.",
    #                     approximate_age:  4,
    #                     sex:    "Male",
    #                     adoption_status: "available",
    #                     shelter_id: "#{@shelter_4.id}")
    @pet_4 = Pet.create(name:  "Goofy",
                        image: "https://static.boredpanda.com/blog/wp-content/uploads/2016/09/dogs-catching-treats-fotos-frei-schnauze-christian-vieler-66-57e8d9d0ec7ee__880.jpg",
                        description: "Hound Mix. Well trained in basic commands. Will catch treats when thrown.",
                        approximate_age:  5,
                        sex:    "Male",
                        adoption_status: "adoption pending",
                        shelter_id: "#{@shelter_1.id}")
  end

  it "can see a pet's information in the system" do
    visit "/pets/#{@pet_1.id}"
    expect(page).to have_css("img[src*='#{@pet_1.image}']")
    expect(page).to have_content(@pet_1.name)
    expect(page).to have_content(@pet_1.approximate_age)
    expect(page).to have_content(@pet_1.description)
    expect(page).to have_content(@pet_1.sex)
    expect(page).to have_content(@pet_1.adoption_status)
    expect(page).to have_content(@pet_1.shelter.name)
  end

  it "can see all pets in the system" do
    visit "/pets"
    expect(page).to have_css("img[src*='#{@pet_1.image}']")
    expect(page).to have_content(@pet_1.name)
    expect(page).to have_content(@pet_1.approximate_age)
    expect(page).to have_content(@pet_1.sex)
    expect(page).to have_content(@pet_1.shelter.name)
    expect(page).to have_css("img[src*='#{@pet_2.image}']")
    expect(page).to have_content(@pet_2.name)
    expect(page).to have_content(@pet_2.approximate_age)
    expect(page).to have_content(@pet_2.sex)
    expect(page).to have_content(@pet_2.shelter.name)
  end

  it "can update a pet" do
    visit "/pets/#{@pet_1.id}"
    click_link('Update Pet')
    expect(current_path).to eq("/pets/#{@pet_1.id}/edit")
    fill_in :name, with: "Bubba"
    fill_in :image, with: "https://www.southernshores.com/images/layout/dog-vacation-information.png"
    fill_in :description, with: "Agile, friendly, and sociable. This dog is nice in public."
    fill_in :approximate_age, with: "7"
    fill_in :sex, with: "Male"
    fill_in :adoption_status, with: "Available"
    click_on 'Update Pet'
    expect(current_path).to eq('/pets')
    expect(page).to have_content("Bubba")
    expect(page).not_to have_content("Zelda")
  end

  it "can delete a pet" do
    visit "/pets/#{@pet_3.id}"
    click_link 'Delete Pet'
    expect(current_path).to eq('/pets')
    expect(page).not_to have_content("Pac Man")
  end

  it "can have a valid link for update pet from the pet index page" do
    visit '/pets'
    click_link('Update Pet', match: :first)
    expect(current_path).to eq("/pets/#{@pet_1.id}/edit")
  end

  it "can delete a pet from the pet index page" do
    visit "/pets"
    click_link('Delete Pet', match: :first)
    expect(current_path).to eq('/pets')
    expect(page).not_to have_content("Zelda")
  end

  it "can have a valid pet link for every pet name" do
    visit "/pets"
    click_link("#{@pet_1.name}")
    expect(current_path).to eq("/pets/#{@pet_1.id}")
    visit "/shelters/#{@shelter_1.id}/pets"
    click_link("#{@pet_4.name}")
    expect(current_path).to eq("/pets/#{@pet_4.id}")


  end





end
