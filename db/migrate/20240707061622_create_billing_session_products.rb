class CreateBillingSessionProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :billing_session_products do |t|
      t.references :billing_product, null: false, foreign_key: true
      t.references :training_session, null: false, foreign_key: true

      t.timestamps
    end

    add_index :billing_session_products, %i[billing_product_id training_session_id], unique: true,
                                                                                     name: "index_billing_session_products_on_billing_product_id_and_ts_id"
  end
end
