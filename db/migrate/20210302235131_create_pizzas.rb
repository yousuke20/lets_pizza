class CreatePizzas < ActiveRecord::Migration[5.2]
  def change
    create_table :pizzas do |t|
      t.string :pizza_name, null: false
      t.string :image_id, null: false
      t.integer :price, null: false
      t.integer :pizza_size, null: false, default: 0
      t.integer :sales_status, null: false, default: 0
      t.timestamps
    end
  end
end
