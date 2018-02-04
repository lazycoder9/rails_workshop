class LikeMutator
  class << self
    MAX_LIKES_PER_HOUR = 5

    def create!(comment, params)
      comment.likes.create(article_id: params[:article_id])
    end

    def validate(comment)
      Articles::Comments::Likes::CreateSchema.
        with(comment: comment).
        call(likes_count_per_hour: MAX_LIKES_PER_HOUR)
    end
  end
end
