class TrainingSession < ApplicationRecord
  belongs_to :language
  belongs_to :country
  belongs_to :category, class_name: "TrainingSession::Category", foreign_key: "training_session_category_id"

  has_many :editors, class_name: "TrainingSession::Editor", foreign_key: "training_session_id"
  has_many :roles, class_name: "TrainingSession::Role", foreign_key: "training_session_id"
  has_many :facilitators, class_name: "TrainingSession::Facilitator", foreign_key: "training_session_id"
  has_many :participants, class_name: "TrainingSession::Participant", foreign_key: "training_session_id"
  has_many :users_as_facilitators, through: :facilitators, source: :user
  has_many :users_as_participants, through: :participants, source: :user

  validates :uuid, presence: true, uniqueness: true
  validates :start_at, :end_at, presence: true
  validates :max_participants, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
end
