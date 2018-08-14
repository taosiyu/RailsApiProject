class CardSerializer < ActiveModel::Serializer
  attributes :id, :title, :detail, :content, :clicks, :images, :cardtype, :other, :created_at
  # belongs_to :user
  # has_many :comments
  # 这里一直会忘记，要显示对应的user直接 :user
  def attributes(*args)
    _data = super(*args)
    _data[:comment_count] = Comment.where("card_id" => object.id).count()
    _data
  end
end
