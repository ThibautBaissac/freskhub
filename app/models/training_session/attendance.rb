class TrainingSession::Attendance < ApplicationRecord
  belongs_to :facilitator, class_name: "TrainingSession::Facilitator"
  belongs_to :participant, class_name: "TrainingSession::Participant"
end
