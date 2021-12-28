class JsonWebToken
  class << self
    def encode(payload, exp = 2.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, ENV["SECRET_KEY_BASE"])
    end
 
    def decode(token)
      body = JWT.decode(token, ENV["SECRET_KEY_BASE"])
      HashWithIndifferentAccess.new body
    rescue
      nil
    end
  end
end
