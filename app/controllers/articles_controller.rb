class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update, :destroy, :new, :create]

  def index
    @article = Article.paginate(page: params[:page], per_page: 5)
  end
  def new
    @article = Article.new
  end
  def create
    @article = Article.new(article_params)
    @article.user = current_user 
    if @article.save
      flash[:notice] = "Article #{@article.title} successfully created"
      redirect_to article_path(@article)  
    else
      render 'new'
    end
  end
  def show
    
  end
  def edit
   
  end
  def update
    if @article.update(article_params)
      flash[:notice] = "Article #{@article.title} was succesfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  def destroy
    @article.destroy
    redirect_to articles_path
    flash[:notice] = "Article #{@article.title} was succesfully deleted"
  end
  private
    def article_params
      params.require(:article).permit(:title, :description)
    end
    def set_article
      @article = Article.find(params[:id])
    end
end