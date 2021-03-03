class Order < ApplicationRecord
  has_many :order_pizzas
  belongs_to :member
  belongs_to :delivery
  
  # enumによる支払方法、注文ステータスの管理
  enum payment_method: {現金: 0, クレジットカード: 1, 銀行振込: 2}
  enum order_status: {入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済: 4}
end
