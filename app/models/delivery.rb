class Delivery < ApplicationRecord
  has_many :orders, dependent: :destroy
  belongs_to :member
  
  # enumによる支払方法の管理
  enum payment_method: {現金: 0, クレジットカード: 1, 銀行振込: 2}
end
