class CartItem < ApplicationRecord
  belongs_to :pizza
  belongs_to :member
  
  validates :pizza_id,:member_id, presence: true
end
