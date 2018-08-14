class Card < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :images, PictureUploader
  serialize :images, JSON
  validates :user_id, presence: true

  has_many :comments, dependent: :destroy

  paginates_per 10


end
