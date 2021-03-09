class Changecolumnstoorders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :delevery_postal_code, :string
    add_column :orders, :delivery_postal_code, :string
  end
end
