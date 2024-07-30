module TrainingSession::Validations
  extend ActiveSupport::Concern

  included do
    validates :uuid, presence: true, uniqueness: true
    validates :start_at, :end_at, presence: true
    validates :max_participants, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1}
    validates :latitude, numericality: {greater_than_or_equal_to: -90, less_than_or_equal_to: 90}, allow_nil: true
    validates :longitude, numericality: {greater_than_or_equal_to: -180, less_than_or_equal_to: 180}, allow_nil: true

    validate :end_at_cannot_be_before_start_at

    private

    def end_at_cannot_be_before_start_at
      return if start_at.blank? || end_at.blank?

      errors.add(:end_at, "can't be before the start date") if end_at < start_at
    end
  end
end
