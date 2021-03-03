class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :pizza_id, null: false
      t.integer :member_id, null: false
      t.integer :number_of_sheets, null: false
      t.timestamps
    end
  end
end
