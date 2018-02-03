class Web::Moderation::ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = resource_article
  end

  def edit
    @article = resource_article
  end

  def update
    @article = resource_article

    if @article.update(article_params)
      redirect_to moderation_article_url(@article)
    else
      render 'edit'
    end
  end

  private

  def articles
    Article.with_state(:on_moderate)
  end

  def resource_article
    articles.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text, :state_event)
  end
end
