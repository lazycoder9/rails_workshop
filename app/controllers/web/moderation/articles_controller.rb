class Web::Moderation::ArticlesController < ApplicationController
  def index
    default = { state_eq: :on_moderate }
    @q = Article.ransack(params[:q] || default)

    @articles = @q.result
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = ModerationArticleType.find(params[:id])

    if @article.update(article_params)
      redirect_to moderation_article_url(@article)
    else
      p @article.errors.inspect
      render 'edit'
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :category_id, :state_event)
  end
end
