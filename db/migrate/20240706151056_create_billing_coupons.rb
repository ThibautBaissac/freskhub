class CreateBillingCoupons < ActiveRecord::Migration[7.1]
  def change
    create_table(:billing_coupons) do |t|
      t.string(:code, null: false)
      t.string(:description)
      t.integer(:current_redemption, null: false, default: 0)
      t.integer(:max_redemption, null: false, default: 1)
      t.datetime(:end_date)
      t.references(:fresk, null: false, foreign_key: true)

      t.timestamps
    end
    add_index(:billing_coupons, :code, unique: true)
  end
end
