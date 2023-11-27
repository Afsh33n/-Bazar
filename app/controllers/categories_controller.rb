class CategoriesController < ApplicationController
  # before_action :require_login, only: [:new, :create]
  # before_action :require_admin, only: [:new, :create]
  def index
    @categories = Category.all
  end

 def show
    @category = Category.find(params[:id])
    @articles = @category.articles
 end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.save
    redirect_to category_path(@category)
    #     redirect_to @category
    # else
    #     render 'new'
  end

end
