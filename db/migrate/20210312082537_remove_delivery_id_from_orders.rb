class RemoveDeliveryIdFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :delivery_id
  end
end
