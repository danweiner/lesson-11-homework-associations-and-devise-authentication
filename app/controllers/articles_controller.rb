class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
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
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated."
      redirect_to articles_path 
    else
      flash.now[:alert] = "An error prevented the article from being updated."
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

    def article_params
      params.require(:article).permit(:title, :body, :author_id)
    end

end

