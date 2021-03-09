class AddColumnCookingStatusToOrderPizzas < ActiveRecord::Migration[5.2]
  def change
    add_column :order_pizzas, :cooking_status, :integer, default: 0, null: false
  end
end
