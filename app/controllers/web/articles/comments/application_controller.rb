class Web::Articles::Comments::ApplicationController < Web::Articles::ApplicationController
  def resource_comment
    @resource_comment ||= resource_article.comments.find(params[:comment_id] || params[:id])
  end
end
