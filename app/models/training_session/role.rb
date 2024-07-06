class TrainingSession::Role < ApplicationRecord
  belongs_to :user
  belongs_to :training_session

  validates :status, :type, presence: true
  validates :type, inclusion: {in: %w[TrainingSession::Participant TrainingSession::Facilitator]}
end
