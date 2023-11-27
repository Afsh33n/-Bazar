class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy] # DRY

  def index
    @articles = Article.all
    @category = Category.find(params[:category_id])
    @articles = @category.articles
  end

  def show
    # @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
    @categories = Category.all
  end

  def create
   @article = Article.new(article_params)
   @article.save
   redirect_to articles_path(@article), notice: 'To lartik in bien creer.'

  end

  def edit
    # @article = Article.find(params[:id])
  end

  def update
    # @article = Article
    @article = Article.update(article_params)
    redirect_to article_path(@article), notice: 'To lartik in bien update.'
  end

  def destroy
    # @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, notice: 'To lartik in bien refasser.'
  end

  private

  def article_params
    params.require(:article).permit(:name, :description, :price, :quantity, :category_id)
  end

  def set_article
   @article = Article.find(params[:id])
  end

end
