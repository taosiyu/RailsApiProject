class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :card

  validates :user_id, presence: true
  validates :card_id, presence: true
  validates :content, presence: true, length: { maximum: 150 }

  paginates_per 2
end
