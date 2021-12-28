class AuthorizeApiRequest
  prepend SimpleCommand

  def initialize(headers = {})
    @headers = headers
  end

  def call
    user
  end

  private

  attr_reader :headers

  def user
    @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
    Rails.logger.info(decoded_auth_token[:user_id])
    Rails.logger.info(@user)
    @user || errors.add(:token, 'Invalid token') && nil
  end

  def decoded_auth_token
    Rails.logger.info("Decoded value")
    Rails.logger.info(JsonWebToken.decode(http_auth_header))
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  def http_auth_header
    if headers['Authorization'].present?
      return headers['Authorization']
    else
      errors.add(:token, 'Missing token')
    end
    nil
  end
end