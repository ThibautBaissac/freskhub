class TrainingSession::Category < ApplicationRecord
  belongs_to :fresk
  has_many :training_sessions

  validates :identifier, presence: true, uniqueness: true
  validates :format, presence: true
end
