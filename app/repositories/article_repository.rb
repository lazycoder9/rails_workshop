module ArticleRepository
  extend ActiveSupport::Concern

  included do
    scope :count_likes, -> { left_joins(:likes).group('article_comment_likes.article_id').count }
  end
end
