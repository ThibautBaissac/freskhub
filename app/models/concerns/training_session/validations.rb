module TrainingSession::Validations
  extend ActiveSupport::Concern

  included do
    validates :uuid, presence: true, uniqueness: true
    validates :start_at, :end_at, presence: true
    validates :max_participants, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  end
end
