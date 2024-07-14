class TrainingSession::Category < ApplicationRecord
  belongs_to :fresk
  has_many :training_sessions, class_name: "TrainingSession", foreign_key: "training_session_category_id",
                               dependent: :restrict_with_exception
  has_many :products, class_name: "Billing::Product", foreign_key: "training_session_category_id",
                      dependent: :restrict_with_exception

  validates :identifier, :format, presence: true
  validates :identifier, uniqueness: {scope: :fresk_id}
end
