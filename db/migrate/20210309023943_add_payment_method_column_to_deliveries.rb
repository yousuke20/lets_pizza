class AddPaymentMethodColumnToDeliveries < ActiveRecord::Migration[5.2]
  def change
    add_column :deliveries, :payment_method, :integer, default: 0, null: false
  end
end
