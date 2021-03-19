class Delivery < ApplicationRecord
  belongs_to :member

  validates :member_id, :name, :postal_code, :address, :telephone_number, presence: true
  validates :postal_code, length: { minimum: 7}
  validates :telephone_number, length: { minimum: 10, maximum: 11}
  # enumによる支払方法の管理
  enum payment_method: { 現金: 0, クレジットカード: 1, 銀行振込: 2 }
end
