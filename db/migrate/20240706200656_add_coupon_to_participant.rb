class AddCouponToParticipant < ActiveRecord::Migration[7.1]
  def change
    add_reference :training_session_roles, :coupon, foreign_key: {to_table: :billing_coupons}
  end
end
