class TrainingSession::Facilitator < TrainingSession::Role
  has_many :attendances, class_name: "TrainingSession::Attendance", foreign_key: "facilitator_id"

  validates :anonymous_count, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
end
