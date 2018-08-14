class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at, :user
  # has_one :user
  # has_one :card
end
