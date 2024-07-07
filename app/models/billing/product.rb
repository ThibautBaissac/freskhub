class Billing::Product < ApplicationRecord
  belongs_to :country
  belongs_to :fresk
  belongs_to :category, class_name: "TrainingSession::Category", foreign_key: "training_session_category_id"
  has_many :orders, class_name: "Billing::Order", foreign_key: "billing_product_id"

  validates :name, :tax_rate, :after_tax_price_cents, :tax_cents, :before_tax_price_cents, :currency,
            presence: true
  validates :tax_rate, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
end
