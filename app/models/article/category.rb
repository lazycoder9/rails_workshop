class Article::Category < ApplicationRecord
  validates :name, presence: true
  validates :slug, presence: true

  has_many :articles
end
