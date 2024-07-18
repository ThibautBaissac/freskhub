FactoryBot.define do
  factory :training_session do
    participants_message { "Welcome participants!" }
    facilitators_message { "Hello facilitators!" }
    uuid { SecureRandom.uuid }
    start_at { 1.day.from_now }
    end_at { 2.days.from_now }
    max_participants { 10 }
    connexion_url { "https://example.com/session" }
    published { false }
    association :language
    association :country
    association :category, factory: :training_session_category

    # Associations can be added here if needed
    # after(:create) do |training_session|
    #   create_list(:editor, 2, training_session:)
    #   create_list(:role, 3, training_session:)
    #   create_list(:facilitator, 2, training_session:)
    #   create_list(:participant, 5, training_session:)
    #   create_list(:session_product, 3, training_session:)
    # end
  end
end
