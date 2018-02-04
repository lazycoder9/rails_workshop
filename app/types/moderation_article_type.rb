class ModerationArticleType < Article
  include ApplicationType

  permit :category_id, :state_event

  validates :category, presence: true
end
