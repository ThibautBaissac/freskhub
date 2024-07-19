class CreateBillingProducts < ActiveRecord::Migration[7.1]
  def change
    create_table(:billing_products) do |t|
      t.string(:name, null: false)
      t.string(:description)
      t.integer(:tax_rate, null: false)
      t.integer(:after_tax_price_cents, null: false)
      t.integer(:tax_cents, null: false)
      t.integer(:before_tax_price_cents, null: false)
      t.string(:currency, null: false, default: "EUR")
      t.references(:country, null: false, foreign_key: true)
      t.references(:fresk, null: false, foreign_key: true)
      t.references(:training_session_category, null: false, foreign_key: true)

      t.timestamps
    end
  end
end
