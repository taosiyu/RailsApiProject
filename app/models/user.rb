class User < ApplicationRecord

  attr_accessor :activation_token

  before_create :create_activation_digest

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 40 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }

  has_secure_password

  has_many :cards, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :dcomments, dependent: :destroy


  # 返回给用户token，根据id来生成token
  def token
     Token.encode(user_id: self.id)
  end

  # 返回一个随机令牌
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # 获取随机字符串
  def User.random_str(num)
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    length = chars.length - 1
    str = chars.sample(num)
  end

  # 返回指定字符串的哈希摘要
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
             BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # 创建并赋值激活令牌和摘要
  def create_activation_digest
    self.activation_token  = User.random_str(6)
    self.activation_digest = User.digest(activation_token)
  end

  # 验证token 查看code会否和数据库的一致
  def authenticated?(code)
    return false if activation_digest.nil?
    BCrypt::Password.new(activation_digest).is_password?(code)
  end


end
