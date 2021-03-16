class OrderPizza < ApplicationRecord
  belongs_to :order
  belongs_to :pizza

  validates :order_id, :pizza_id, :price, :number_of_sheets, presence: true
  # enumによる調理ステータスの管理
  enum cooking_status: { 調理中: 0, 調理完了: 1, 調理不可: 2 }
end
