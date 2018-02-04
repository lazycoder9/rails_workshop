class Article::Comment::Like < ApplicationRecord
  belongs_to :article
  belongs_to :comment

  include Article::Comment::LikeRepository
end
