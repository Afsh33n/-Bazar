class BasketsController < ApplicationController

  def show
    @basket = current_user.basket

    if @basket
      @basket_items = @basket.basket_items
    else
      redirect_to root_path, notice: 'Azout dans panier avant.'
    end
  end

  def add_to_basket
    @article = Article.find(params[:id])
    @basket = current_user.basket
    @basket_item = BasketItem.new(basket: @basket, article: @article, quantity: 1)

    if @basket_item.save
      redirect_to @article, notice: 'Sa lartik la in bien azout a to panier'
    else
      redirect_to @article, alert: 'Pan resi azout dans to panier. Essaye encore.'
    end
  end 
end
