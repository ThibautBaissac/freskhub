class Billing::Order < ApplicationRecord
  belongs_to :product, class_name: "Billing::Product", foreign_key: "billing_product_id"
  belongs_to :participant, class_name: "TrainingSession::Participant"

  validates :tax_rate, :after_tax_price_cents, :tax_cents, :before_tax_price_cents, :currency, :status, presence: true
  validates :tax_rate, :after_tax_price_cents, :tax_cents, :before_tax_price_cents,
            numericality: {only_integer: true, greater_than_or_equal_to: 0}
end
