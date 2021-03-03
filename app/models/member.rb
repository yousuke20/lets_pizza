class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :deliveries, dependent: :destroy
  
  # enumによる退会ステータスの管理
  enum withdrawal_status: {有効: true, 退会: false}
end
