class User < ApplicationRecord
  belongs_to :country
  has_many :user_languages
  has_many :languages, through: :user_languages

  encrypts :email, deterministic: true, downcase: true

  validates :uuid, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :ui_language, presence: true, inclusion: {in: %w[fr en]}
  validates :country, presence: true
  validates :latitude, numericality: {greater_than_or_equal_to: -90, less_than_or_equal_to: 90}, allow_nil: true
  validates :longitude, numericality: {greater_than_or_equal_to: -180, less_than_or_equal_to: 180}, allow_nil: true
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}
  validate :last_login_at_cannot_be_in_the_future

  private

  def last_login_at_cannot_be_in_the_future
    return unless last_login_at.present? && last_login_at > Time.now

    errors.add(:last_login_at, "can't be in the future")
  end
end
