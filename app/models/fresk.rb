class Fresk < ApplicationRecord
  has_many :categories, class_name: "TrainingSession::Category", dependent: :restrict_with_exception
  has_many :training_sessions, class_name: "TrainingSession", through: :categories, dependent: :restrict_with_exception
  has_many :products, class_name: "Billing::Product", dependent: :restrict_with_exception

  validates :name, :identifier, presence: true
  validates :identifier, uniqueness: true
end
