class ArticlesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)

    if @article.save
      redirect_to article_path(@article), notice: "Article was successfully created."
    else
      flash.now[:error] = "An error prevented the article from being created."
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated."
      redirect_to article_path(@article)
    else
      flash.now[:alert] = "An error prevented the article from being updated."
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

    def find_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :body, :author_id, tag_ids: [])
    end

end

