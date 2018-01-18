# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Photo.destroy_all
Category.destroy_all
Event.destroy_all
Profile.destroy_all
User.destroy_all

# Seed categories, keep values
family_fun = Category.create(name: "Fun for the whole family")
dance_dnb = Category.create(name: "Dance, Drum 'n Bass'")
dance_80_90 = Category.create(name: "Dance, 80's & 90's")
movie_horror = Category.create(name: "Movie night, horror")
movie_romance = Category.create(name: "Movie night, romance")
food_thought = Category.create(name: "Food for thought")
coding_carnival = Category.create(name: "Coding, Code Carnival!")
coding_review = Category.create(name: "Coding, code review")

# Seed users, keep values
zjan = User.create!(
  email: 'zjan@codaisseur.com',
  password: '123456'
)
marina = User.create!(
  email: 'marina@codaisseur.com',
  password: '123456'
)
peter = User.create!(
  email: 'peter@codaisseur.com',
  password: '123456'
)

# Seed events
event_1 = Event.create!(
  name: 'Vreten!',
  description: 'Many say exploration is part of our destiny, but it’s actually our duty to future generations and their quest to ensure the survival of the human species.',
  location: 'My Home', price: 119.95, capacity: 5,
  includes_food: true, includes_drinks: false,
  starts_at: 1.days.from_now, ends_at: 2.days.from_now,
  active: true, user: zjan, categories: [family_fun, food_thought]
)

event_2 = Event.create!(
  name: 'Drinken!',
  description: 'As I stand out here in the wonders of the unknown at Hadley, I sort of realize there’s a fundamental truth to our nature, Man must explore . . . and this is exploration at its greatest.',
  location: 'Bar next 2 my home', price: 69.95, capacity: 15,
  includes_food: false, includes_drinks: true,
  starts_at: 3.days.from_now, ends_at: 4.days.from_now,
  active: true, user: zjan, categories: [movie_horror, coding_carnival]
)

# Photos
photo1 = Photo.create!(remote_image_url: "http://res.cloudinary.com/dnwkjak4p/image/upload/v1476007276/28dab8dd748210a53c77bb284558a5ce5905ca6a_git9a9.jpg", event: event_1)
photo2 = Photo.create!(remote_image_url: "http://res.cloudinary.com/dnwkjak4p/image/upload/v1476007276/99ca8b27a84b46c373803df268167d15c3488e99_tvrfql.jpg", event: event_1)
photo3 = Photo.create!(remote_image_url: "http://res.cloudinary.com/dnwkjak4p/image/upload/v1476007282/20161005-q3895_hjoc8t.png", event: event_1)

photo4 = Photo.create!(remote_image_url: "http://res.cloudinary.com/dnwkjak4p/image/upload/v1476007284/20161005-60rbr_rp41qn.png", event: event_2)
photo5 = Photo.create!(remote_image_url: "http://res.cloudinary.com/dnwkjak4p/image/upload/v1476007288/20161005-e8xxp_cap4y9.png", event: event_2)
photo6 = Photo.create!(remote_image_url: "http://res.cloudinary.com/dnwkjak4p/image/upload/v1476007287/20161005-zsogv_l4urst.png", event: event_2)

photo7 = Photo.create!(remote_image_url: "http://res.cloudinary.com/dnwkjak4p/image/upload/v1476007290/0676bf3a1f914f38e9b5b6b9d69e381495aa6abb_abx9ir.jpg", event: event_1)
photo8 = Photo.create!(remote_image_url: "http://res.cloudinary.com/dnwkjak4p/image/upload/v1476007291/20161005-brctd_fju0e9.png", event: event_2)
photo9 = Photo.create!(remote_image_url: "http://res.cloudinary.com/dnwkjak4p/image/upload/v1476007291/20161005-ngwqx_erq7sf.png", event: event_1)
