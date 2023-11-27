class PagesController < ApplicationController
 skip_before_action :authenticate_user!, only: :home
  def home
    @categories = Category.includes(:articles).all
  end
end
