FactoryBot.define do
  factory :user do
    firstname { "John" }
    lastname { "Doe" }
    sequence(:email) { |n| "string#{n}@example.com" }
    uuid { SecureRandom.uuid }
    latitude { "45.000" }
    longitude { "5.000" }
    locale { "fr" }
    password { "password" }
    country { create(:country) }
  end
end
