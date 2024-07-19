class CreateBillingOrders < ActiveRecord::Migration[7.1]
  def change
    create_table(:billing_orders) do |t|
      t.integer(:tax_rate, null: false)
      t.integer(:after_tax_price_cents, null: false)
      t.integer(:tax_cents, null: false)
      t.integer(:before_tax_price_cents, null: false)
      t.string(:currency, null: false)
      t.string(:status, null: false)
      t.references(:billing_product, null: false, foreign_key: true)
      t.references(:participant, null: false, foreign_key: {to_table: :training_session_roles})

      t.timestamps
    end
  end
end
