# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Course.create([{ name: 'Main Course' }, { name: 'Starters' }, { name: 'Cocktails' }, { name: 'Desserts' }, { name: 'Soups' }, { name: 'Salad' } ])

Dish.create([
              { name: "Sahi Paneer", price: 400, description: "Delicious Sahi panner", course_id: 1}, { name: "Harabhara kabab", price: 200, description: "Delicious Harabhara kabab", course_id: 2},
              { name: "Taquila with Lemon", price: 200, description: "Taquila with Lemon", course_id: 3},
              { name: "Gulab Jamun", price: 100, description: "Delicious Gulab Jamun", course_id: 4}, 
              { name: "Hot and Sour", price: 150, description: "Delicious Hot and sour", course_id: 5}, 
              { name: "Green Salad", price: 200, description: "This is continental salad", course_id: 6}
            ])
