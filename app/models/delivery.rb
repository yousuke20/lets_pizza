class Delivery < ApplicationRecord
  has_many :orders, dependent: :destroy
  belongs_to :member
end
