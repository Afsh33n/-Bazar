class BasketsController < ApplicationController
  before_action :authenticate_user!

  def show
    @basket = Basket.create(user: current_user)
    if @basket
      @basket_items = @basket.basket_items
    else
      redirect_to root_path, notice: 'Azout dans panier avant.'
    end
  end

  def create
    @article = Article.find(params[:id])
    @basket = current_user.basket
    @basket_item = BasketItem.new(basket: @basket, article: @article, quantity: 1)

    if @basket_item.save
      redirect_to @article, notice: 'Sa lartik la in bien azout a to panier'
    else
      redirect_to @article, alert: 'Pan resi azout dans to panier. Essaye encore.'
    end
  end

  private

  def basket_item_params
    params.require(:basket_item).permit(:quantity)
  end

end
