class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :member_id, null: false
      t.integer :delivery_id, null: false
      t.string :delevery_postal_code, null: false
      t.string :delivery_address, null: false
      t.string :delivery_name, null: false
      t.integer :delivery_telephone_number, null: false
      t.integer :billing_amount, null: false
      t.integer :payment_method, null: false, default: 0
      t.integer :order_status, null: false, default: 0
      t.timestamps
    end
  end
end
