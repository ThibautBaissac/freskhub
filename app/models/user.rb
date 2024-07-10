class User < ApplicationRecord
  has_secure_password

  belongs_to :country
  has_many :user_languages
  has_many :languages, through: :user_languages

  has_many :session_roles, class_name: "TrainingSession::Role", foreign_key: "user_id"
  has_many :editor_roles, class_name: "TrainingSession::Editor", foreign_key: "user_id"
  has_many :facilitator_roles, class_name: "TrainingSession::Facilitator", foreign_key: "user_id"
  has_many :participant_roles, class_name: "TrainingSession::Participant", foreign_key: "user_id"
  has_many :edited_sessions, through: :editor_roles, source: :training_session
  has_many :facilitated_sessions, through: :facilitator_roles, source: :training_session
  has_many :participated_sessions, through: :participant_roles, source: :training_session

  has_many :user_infos, class_name: "User::Info"
  has_many :fresks, through: :user_infos
  has_many :user_roles, through: :user_infos

  encrypts :email, deterministic: true, downcase: true

  validates :uuid, presence: true, uniqueness: true
  validates :locale, presence: true, inclusion: {in: I18n.available_locales.map(&:to_s)}
  validates :country, presence: true
  validates :latitude, numericality: {greater_than_or_equal_to: -90, less_than_or_equal_to: 90}, allow_nil: true
  validates :longitude, numericality: {greater_than_or_equal_to: -180, less_than_or_equal_to: 180}, allow_nil: true
  validates :email, presence: true, uniqueness: true,
                    format: {with: Constants::Regex::EMAIL, message: "must be a valid email address"}

  validate :last_login_at_cannot_be_in_the_future

  # (?=.{12,}) : at least 12 chars
  # (?=.*\d) : at least 1 number
  # (?=.*[a-z]) : at least 1 downcase letter
  # (?=.*[A-Z]) : at least 1 uppercase letter
  # (?=.*[@:,\-?*_()!#$%^&+=]) : at least 1 of these special chars
  # validates :password, format: Constants::User::PASSWORD_REGEX, if: proc { |u| u.password.present? }
  # TODO: Uncomment the line above and remove the line below when the password regex is ready
  validates :password, length: {minimum: 1}, if: proc { |u| u.password.present? }

  generates_token_for :password_reset, expires_in: 15.minutes do
    password_salt&.last(10)
  end

  private

  def last_login_at_cannot_be_in_the_future
    return unless last_login_at.present? && last_login_at > Time.now

    errors.add(:last_login_at, "can't be in the future")
  end
end
