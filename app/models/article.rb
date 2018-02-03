class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :category, required: false
  validates :title, presence: true,
                    length: { minimum: 5 }

  state_machine :state, initial: :draft do
    state :draft
    state :on_moderate
    state :published

    event :send_to_moderation do
      transition draft: :on_moderation
    end

    event :moderate do
      transition on_moderation: :published
    end
  end
end
