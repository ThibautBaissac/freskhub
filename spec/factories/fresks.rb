FactoryBot.define do
  factory :fresk do
    name { "Sample Fresk" }
    sequence(:identifier) { |n| "sample_identifier_#{n}" }
    url { "https://example.com" }

    # Associations can be added here if needed
    # after(:create) do |fresk|
    #   create_list(:category, 3, fresk: fresk)
    #   create_list(:product, 2, fresk: fresk)
    #   create(:user_info, fresk: fresk)
    # end
  end
end
