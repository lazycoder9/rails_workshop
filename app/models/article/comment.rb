class Article::Comment < ApplicationRecord
  belongs_to :article
  has_many :likes
end
