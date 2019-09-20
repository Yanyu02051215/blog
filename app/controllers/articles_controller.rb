class ArticlesController < ApplicationController
  before_action :find_article, only: [:show,:edit,:update,:destroy]
  def index
    @articles = Article.order(created_at: :desc)
  end

  def show
  end

  def edit
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(artcle_params)
     if @article.save
      redirect_to @article,notice:'投稿に成功しました'
     else
      render :new,alert:'投稿に失敗しました'
     end
  end

  def update
    if @article.update(artcle_params)
      redirect_to @article,notice:'編集に成功しました'
    else
      render :edit,alert:'編集に失敗しました'
    end
  end

  def destroy
    if @article.destroy
      redirect_to root_path,notice:'削除に成功しました'
    else
      redirect_to root_path,alert:'削除に失敗しました'
    end
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def artcle_params
    params.require(:article).permit(:title, :body)
  end
end
