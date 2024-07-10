class TrainingSession < ApplicationRecord
  include Decorable

  belongs_to :language
  belongs_to :country
  belongs_to :category, class_name: "TrainingSession::Category", foreign_key: "training_session_category_id"

  has_many :editors, class_name: "TrainingSession::Editor", foreign_key: "training_session_id"
  has_many :roles, class_name: "TrainingSession::Role", foreign_key: "training_session_id"
  has_many :facilitators, class_name: "TrainingSession::Facilitator", foreign_key: "training_session_id"
  has_many :participants, class_name: "TrainingSession::Participant", foreign_key: "training_session_id"
  has_many :users_as_facilitators, through: :facilitators, source: :user
  has_many :users_as_participants, through: :participants, source: :user

  has_many :session_products, class_name: "Billing::SessionProduct", foreign_key: "training_session_id"
  has_many :products, class_name: "Billing::Product", through: :session_products
  has_many :orders, through: :participants, source: :orders
  has_many :coupons, through: :participants

  validates :uuid, presence: true, uniqueness: true
  validates :start_at, :end_at, presence: true
  validates :max_participants, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}

  scope :upcoming, -> { where("end_at > ?", Time.current) }
  scope :past, -> { where("end_at <= ?", Time.current) }
  scope :by_language, ->(language) { where(language:) }
  scope :by_country, ->(country) { where(country:) }
  scope :by_category, ->(category) { where(category:) }
  scope :by_user_as_editor, lambda { |user|
                              joins(:editors).where("training_session_editors.user_id = ?", user.id)
                            }
  scope :by_user_as_facilitator, ->(user) { by_user_and_role(user, :facilitator) }
  scope :by_user_as_participant, ->(user) { by_user_and_role(user, :participant) }
  scope :by_user_and_role, lambda { |user, role|
                             joins("#{role.to_s.pluralize}".to_sym).where("training_session_roles.user_id = ? AND type = ?", user.id, "TrainingSession::#{role.to_s.capitalize}")
                           }

  def to_param
    uuid
  end
end
