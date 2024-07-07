class Billing::SessionProduct < ApplicationRecord
  belongs_to :product, class_name: "Billing::Product", foreign_key: "billing_product_id"
  belongs_to :training_session

  validates :billing_product_id, uniqueness: {scope: :training_session_id}
end
