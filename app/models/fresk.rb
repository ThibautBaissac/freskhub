class Fresk < ApplicationRecord
  has_many :catgories, class_name: "TrainingSession::Category", dependent: :restrict_with_exception

  validates :name, :identifier, presence: true
  validates :identifier, uniqueness: true
end
