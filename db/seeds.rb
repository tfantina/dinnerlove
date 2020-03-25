# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

usr = User.create!([id: 1, email: "vivianiholden@gmail.com", password: 'Supersecure55', password_confirmation:'Supersecure55'])

dinners = Dinner.create!([{name: "Tofu teriyaki", notes: "Very yummy", user_id: 1},
                         {name: "Rice and beans", notes: "But only with mucho fun tonight sauce", user_id: 1},
                         {name: "Burgers", notes: "Non beef please", user_id: 1},
                         {name: "Burritos", user_id: 1},
                         {name: "Taco Salad", user_id: 1},
                         {name: "Spagetti", user_id: 1},
                         {name: "Stir fry", user_id: 1},
                         {name: "BBQ Tofu", user_id: 1},
                         {name: "Potato and Leek Soup", user_id: 1},
                         {name: "Chili", user_id: 1},
                         {name: "Irish Stew", user_id: 1},
                         {name: "Wraps", user_id: 1},
                         {name: "Paella", user_id: 1, notes: "Original recipe from Hello Fresh"},
                         {name: "Cheese Tortellini", user_id: 1, notes: "Original recipe from Hello Fresh"},
                         {name: "Halloumi Salad", user_id: 1, notes: "Original recipe from Hello Fresh"},
                         {name: "Halloumi and potato rosti", user_id: 1, note: "Original recipe from Hello Fresh"},
                         {name: "Paneer and Sweet Potato Curry", user_id: 1, note: "Original recipe from Hello Fresh"},
                         {name: "Bang Bang Tofu Bowl", user_id: 1, note: "Original recipe from Hello Fresh"}])
