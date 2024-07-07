class User < ApplicationRecord
  belongs_to :country
  has_many :user_languages
  has_many :languages, through: :user_languages

  has_many :roles, class_name: "TrainingSession::Role", foreign_key: "user_id"
  has_many :editor_roles, class_name: "TrainingSession::Editor", foreign_key: "user_id"
  has_many :facilitator_roles, class_name: "TrainingSession::Facilitator", foreign_key: "user_id"
  has_many :participant_roles, class_name: "TrainingSession::Participant", foreign_key: "user_id"
  has_many :edited_sessions, through: :editor_roles, source: :training_session
  has_many :facilitated_sessions, through: :facilitator_roles, source: :training_session
  has_many :participated_sessions, through: :participant_roles, source: :training_session

  has_many :user_infos, class_name: "User::Info"
  has_many :fresks, through: :user_infos

  encrypts :email, deterministic: true, downcase: true

  validates :uuid, presence: true, uniqueness: true
  validates :ui_language, presence: true, inclusion: {in: %w[fr en]}
  validates :country, presence: true
  validates :latitude, numericality: {greater_than_or_equal_to: -90, less_than_or_equal_to: 90}, allow_nil: true
  validates :longitude, numericality: {greater_than_or_equal_to: -180, less_than_or_equal_to: 180}, allow_nil: true
  validates :email, presence: true, uniqueness: true,
                    format: {with: Constants::Regex::EMAIL, message: "must be a valid email address"}

  validate :last_login_at_cannot_be_in_the_future

  private

  def last_login_at_cannot_be_in_the_future
    return unless last_login_at.present? && last_login_at > Time.now

    errors.add(:last_login_at, "can't be in the future")
  end
end
