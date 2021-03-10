class RemovePaymentMethodColumnFromDeliveries < ActiveRecord::Migration[5.2]
  def change
    remove_column :deliveries, :payment_method
  end
end
