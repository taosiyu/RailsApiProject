class Dcomment < ApplicationRecord
  belongs_to :user
  belongs_to :discovery

  validates :user_id, presence: true
  validates :discovery_id, presence: true
  validates :content, presence: true, length: { maximum: 150 }

  paginates_per 1
end
