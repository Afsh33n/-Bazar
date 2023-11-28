class Basket < ApplicationRecord
  belongs_to :user
  has_many :basket_items, dependent: :destroy
  has_many :articles, through: :basket_items

  def add_article(article)
    basket_item = basket_items.find_by(article: article)
    if basket_item
      basket_item.quantity += 1
    else
      basket_item = BasketItem.new(basket: self, article: article)
    end
    basket_item
  end
end
