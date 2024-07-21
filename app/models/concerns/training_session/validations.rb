module TrainingSession::Validations
  extend ActiveSupport::Concern

  included do
    validates :uuid, presence: true, uniqueness: true
    validates :start_at, :end_at, presence: true
    validates :max_participants, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
    validates :latitude, numericality: {greater_than_or_equal_to: -90, less_than_or_equal_to: 90}, allow_nil: true
    validates :longitude, numericality: {greater_than_or_equal_to: -180, less_than_or_equal_to: 180}, allow_nil: true
  end
end
