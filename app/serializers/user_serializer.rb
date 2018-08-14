class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :gender, :phone, :email, :image, :created_at
  has_many :cards

  # def attributes(*args)
  #   _data = super(*args)
  #   { data: object.token}
  # end
end
