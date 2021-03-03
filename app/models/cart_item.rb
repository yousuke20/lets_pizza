class CartItem < ApplicationRecord
  belongs_to :pizza
  belongs_to :member
end
