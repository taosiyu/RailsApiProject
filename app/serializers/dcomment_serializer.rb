class DcommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at
  has_one :user
  has_one :discovery
end
