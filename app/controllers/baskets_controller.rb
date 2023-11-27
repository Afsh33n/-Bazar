class BasketsController < ApplicationController

  def show
    @basket = current_user.basket

    if @basket
      @basket_items = @basket.basket_items
    else
      redirect_to root_path, notice: 'Azout dans panier avant.'
    end
  end
end
