# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Pet.destroy_all
Shelter.destroy_all

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
shelter_6 = Shelter.create(name:     "Pretty Good Pets",
                            address:  "87 Lower Expectations St.",
                            city:     "Mediocre",
                            state:    "Maine",
                            zip:      "04005")
pet_1 = Pet.create(name:  "Zelda",
                    image: "https://i.ytimg.com/vi/3dcli9i_pvA/hqdefault.jpg",
                    description: "Golden Retriever with a great smile.",
                    approximate_age:  2,
                    sex:    "Female",
                    adoption_status: "available",
                    shelter_id: shelter_2.id)
pet_2 = Pet.create(name:  "Taylor",
                    image: "https://i.barkpost.com/wp-content/uploads/2015/10/reddit-dog-jokes-20.jpg?q=70&fit=crop&crop=entropy&w=808&h=808",
                    description: "Chocolate Lab Mix. Loves Cake.",
                    approximate_age:  4,
                    sex:    "Female",
                    adoption_status: "available",
                    shelter_id: shelter_3.id)
pet_3 = Pet.create(name:  "Pac Man",
                    image: "https://www.australian-shepherd-lovers.com/image-files/dog-chewing.jpg",
                    description: "Australian Shephard.  Has mild separation anxiety.  May need to be crated when alone.",
                    approximate_age:  4,
                    sex:    "Male",
                    adoption_status: "available",
                    shelter_id: shelter_4.id)
pet_4 = Pet.create(name:  "Goofy",
                    image: "https://static.boredpanda.com/blog/wp-content/uploads/2016/09/dogs-catching-treats-fotos-frei-schnauze-christian-vieler-66-57e8d9d0ec7ee__880.jpg",
                    description: "Hound Mix. Well trained in basic commands. Will catch treats when thrown.",
                    approximate_age:  5,
                    sex:    "Male",
                    adoption_status: "adoption pending",
                    shelter_id: shelter_1.id)
