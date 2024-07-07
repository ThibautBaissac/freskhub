class Billing::Product < ApplicationRecord
  belongs_to :country
  belongs_to :fresk
  belongs_to :category, class_name: "TrainingSession::Category", foreign_key: "training_session_category_id"
end
