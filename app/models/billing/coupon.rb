class Billing::Coupon < ApplicationRecord
  belongs_to :fresk
  has_many :participants, class_name: "TrainingSession::Participant", dependent: :restrict_with_exception
end
