class DiscoverySerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :dtype, :image, :created_at

  def attributes(*args)
    _data = super(*args)
    _data[:comment_count] = Dcomment.where("discovery_id" => object.id).count()
    _data
  end
end
