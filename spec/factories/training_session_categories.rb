# spec/factories/training_session_categories.rb
FactoryBot.define do
  factory :training_session_category, class: "TrainingSession::Category" do
    identifier { "General" }
    format { "online" }
    fresk
  end
end
