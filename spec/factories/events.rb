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
    # Needed because of validation event time
    starts_at         1.days.from_now
    ends_at           3.days.from_now
    active            true
    user              { build(:user) }

    trait :active do
      active true
    end

    trait :inactive do
      active false
    end
  end
end
