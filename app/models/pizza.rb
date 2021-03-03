class Pizza < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_pizzas, dependent: :destroy
  attachment :image
  
  # enumによるピザのサイズ、販売ステータスの管理
  enum sales_status: { 販売中: 0, 販売停止中: 1}
  enum pizza_size: { small（直径23cm）: 0, medium（直径28cm）: 1, large（直径33cm）: 2}
end
