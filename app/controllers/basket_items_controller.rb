class BasketItemsController < ApplicationController
  before_action :authenticate_user!

  def show
    @basket_item = BasketItem.find(params[:id])
    @basket_items = @basket.basket_items
  end

  def add_to_basket
    @article = Article.find(params[:article_id])
    @basket = current_user.basket
    @basket_item = BasketItem.new(basket: @basket, article: @article)
    @basket_item.save
    redirect_to basket_path(@basket)
  end

  def update_quantity
    @basket_item = BasketItem.find(params[:id])
    @basket_item.update(quantity: params[:quantity])
    redirect_to basket_path(current_user.basket), notice: 'To panier a jour'

    def basket_item_params
      params.require(:basket_item).permit(:quantity)
    end
  end

  def destroy
    @basket_item = BasketItem.find(params[:id])
    @basket_item.destroy
    redirect_to basket_path(current_user.basket), notice: 'Sa item la in refasser.'
  end

  def proceed_to_checkout
    @basket = current_user.basket
    @basket.update(status: 'paid')
    redirect_to basket_path(@basket), notice: 'To panier complet'
  end
end
