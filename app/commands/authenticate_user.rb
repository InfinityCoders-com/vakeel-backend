class AuthenticateUser
  prepend SimpleCommand

  def initialize(email)
    @email = email
  end

  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  attr_accessor :email, :password

  def user
    user = User.find_by_email(email)
    return user if user

    errors.add :user_authentication, 'User not found'
    nil
  end
end