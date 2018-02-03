class ModerationArticleType < Article
  include ApplicationType

  permit :category_id

  validates :category_id, presence: true
end
