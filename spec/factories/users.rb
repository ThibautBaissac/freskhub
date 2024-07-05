FactoryBot.define do
  factory :user do
    firstname { "John" }
    lastname { "Doe" }
    sequence(:email) { |n| "string#{n}@example.com" }
    uuid { SecureRandom.uuid }
    latitude { "45.000" }
    longitude { "5.000" }
    country { create(:country) }
  end
end
