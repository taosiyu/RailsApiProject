class Token

  MY_SECRET = 'my$ecretK3y'

  def self.encode(payload)
    JWT.encode(payload, MY_SECRET)
  end

  def self.decode(token)
    HashWithIndifferentAccess.new(JWT.decode(token, MY_SECRET)[0])
  rescue
    nil
  end
end
