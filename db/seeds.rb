# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#C
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
50.times do
Cat.create!(name: Faker::Cat.name, color: "black", birth_date: Faker::Date.birthday(1,5), sex: "m", description: "blahablahalah")
end
