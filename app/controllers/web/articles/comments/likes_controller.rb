class Web::Articles::Comments::LikesController < Web::Articles::Comments::ApplicationController
  def create
    if validation.success?
      LikeMutator.create!(resource_comment, permitted_params)
      redirect_to resource_article
    else
      redirect_to resource_article, notice: validation.errors
    end
  end

  private 

  def permitted_params
    params.permit(:article_id)
  end

  def validation
    LikeMutator.validate(resource_comment)
  end
end
