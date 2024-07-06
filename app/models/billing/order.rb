class Billing::Order < ApplicationRecord
  belongs_to :billing_product
  belongs_to :participant, class_name: "TrainingSession::Participant"
end
