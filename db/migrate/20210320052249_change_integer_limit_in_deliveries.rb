class ChangeIntegerLimitInDeliveries < ActiveRecord::Migration[5.2]
  def change
    change_column :deliveries, :telephone_number, :integer, limit: 8
    change_column :orders, :delivery_postal_code, :string, null: false
    change_column :orders, :delivery_telephone_number, :integer, limit: 8
  end
end
