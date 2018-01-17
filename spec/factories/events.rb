# spec/factories/events.rb

FactoryBot.define do
  factory :event do
    name              { Faker::Lorem.words(3).join(' ') }
    description       { Faker::Lorem.sentence(40) }
    location          "Olympic Stadium"
    price             { Faker::Commerce.price }
    capacity          20
    includes_food     true
    includes_drinks   false
    starts_at         Time.now
    ends_at           Time.now
    active            true
    user              { build(:user) }
    categories        []

    trait :active do
      active true
    end

    trait :inactive do
      active false
    end
  end
end
