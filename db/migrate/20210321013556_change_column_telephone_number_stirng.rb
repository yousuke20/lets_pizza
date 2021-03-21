class ChangeColumnTelephoneNumberStirng < ActiveRecord::Migration[5.2]
  def change
    change_column :deliveries, :telephone_number, :string, null: false
    change_column :orders, :delivery_telephone_number, :string, null: false
  end
end
