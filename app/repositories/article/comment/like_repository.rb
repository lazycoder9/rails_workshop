module Article::Comment::LikeRepository
  extend ActiveSupport::Concern

  included do
    scope :desc_ordered, -> { order(created_at: :desc) }
    scope :time_restraint, -> { where('created_at > ?', 1.hour.ago) }
  end
end