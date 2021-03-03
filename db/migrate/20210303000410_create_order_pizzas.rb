class CreateOrderPizzas < ActiveRecord::Migration[5.2]
  def change
    create_table :order_pizzas do |t|
      t.integer :order_id, null: false
      t.integer :pizza_id, null: false
      t.integer :price, null: false
      t.integer :number_of_sheets, null: false
      t.integer :number_of_sheets, null: false, default: 0
      t.timestamps
    end
  end
end
