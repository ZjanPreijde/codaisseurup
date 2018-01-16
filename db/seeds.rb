# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

zjan = User.create!(
  email: 'zjan@codaisseur.com',
  password: '123456'
)

# t.string :name
# t.text :description
# t.string :location
# t.decimal :price
# t.integer :capacity
# t.boolean :includes_food
# t.boolean :includes_drinks
# t.datetime :starts_at
# t.datetime :ends_at
# t.boolean :active
time1 = 25.hours.from_now
time2 = 30.hours.from_now
time3 = 49.days.from_now
time4 = 54.days.from_now
Event.create!(
  name: 'Vreten!',
  description: 'Many say exploration is part of our destiny, but it’s actually our duty to future generations and their quest to ensure the survival of the human species.',
  location: 'My Home', price: 119.95, capacity: 5,
  includes_food: true, includes_drinks: false,
  starts_at: time1, ends_at: time2, active: true, user: zjan)

  Event.create!(
    name: 'Drinken!',
    description: 'As I stand out here in the wonders of the unknown at Hadley, I sort of realize there’s a fundamental truth to our nature, Man must explore . . . and this is exploration at its greatest.',
    location: 'Bar next 2 my home', price: 69.95, capacity: 15,
    includes_food: false, includes_drinks: true,
    starts_at: time2, ends_at: time3, active: true, user: zjan)
