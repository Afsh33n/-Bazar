class Article < ApplicationRecord
  belongs_to :category
  has_many :basket_items, dependent: :destroy
end
