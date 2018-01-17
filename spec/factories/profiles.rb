# spec/factories/profiles.rb

FactoryBot.define do
  factory :profile do
    first_name  { Faker::Name.first_name }
    last_name   { Faker::Name.last_name }
    bio         { Faker::Lorem.sentence }
    # user        { build(:user) }  Not on codaisseur's github
  end

end
