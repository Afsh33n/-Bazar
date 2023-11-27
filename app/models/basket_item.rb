class BasketItem < ApplicationRecord
  belongs_to :basket
  belongs_to :article

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
