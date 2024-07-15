class Country < ApplicationRecord
  validates :name, :alpha2_code, :alpha3_code, presence: true
  validates :name, :alpha2_code, :alpha3_code, uniqueness: true

  default_scope { order(name: :asc) }

  has_many :users, dependent: :restrict_with_exception
  has_many :products, class_name: "Billing::Product", dependent: :restrict_with_exception
  has_many :training_sessions
end
