class Fresk < ApplicationRecord
  include Decorable

  has_many :categories, class_name: "TrainingSession::Category", dependent: :restrict_with_exception
  has_many :training_sessions, class_name: "TrainingSession", through: :categories, dependent: :restrict_with_exception
  has_many :products, class_name: "Billing::Product", dependent: :restrict_with_exception
  has_many :user_infos, class_name: "User::Info", dependent: :restrict_with_exception
  has_many :users, through: :user_infos
  has_many :translations, as: :translatable, dependent: :destroy

  validates :name, :identifier, presence: true
  validates :identifier, uniqueness: true
end
