class Web::Articles::ApplicationController < Web::ApplicationController
  def resource_article
    @resource_article ||= Article.find(params[:article_id] || params[:id])
  end
end
