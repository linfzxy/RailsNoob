class ArticlesController < ApplicationController
  def new
    puts 444444444444444
    @article=Article.new
  end
  def create
    puts 55555555555
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end
  def show
    @article = Article.find(params[:id])
  end
  def index
    @articles=Article.all
  end
  def edit
    @article=Article.find(params[:id])
  end
  def update
    @article=Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end
  def destroy
    Article.destroy(params[:id])
    puts articles_path.inspect
    redirect_to articles_path
  end
end
private
  def article_params
    params.require(:article).permit(:title,:text)
  end