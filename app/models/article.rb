class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, class_name: 'Comment::Like'
  has_many :links, inverse_of: :article, dependent: :destroy
  belongs_to :category, required: false

  accepts_nested_attributes_for :links, reject_if: :all_blank, allow_destroy: true

  validates :title, presence: true, length: { minimum: 5 }

  state_machine :state, initial: :draft do
    state :draft
    state :on_moderate
    state :published

    event :send_to_moderation do
      transition draft: :on_moderate
    end

    event :publish do
      transition on_moderate: :published
    end
  end

  include ArticleRepository
end
