class TrainingSession::Participant < TrainingSession::Role
  belongs_to :coupon, class_name: "Billing::Coupon", optional: true
  has_many :attendances, class_name: "TrainingSession::Attendance", foreign_key: "participant_id"
  has_many :orders, class_name: "Billing::Order", foreign_key: "participant_id"

  validate :anonymous_count_must_be_zero

  def attendance
    attendances&.first
  end

  private

  def anonymous_count_must_be_zero
    errors.add(:anonymous_count, "must be zero") unless anonymous_count == 0
  end
end
