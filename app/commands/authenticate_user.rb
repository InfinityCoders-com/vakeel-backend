class AuthenticateUser
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    JsonWebToken.encode(user_id: @user.id) if user
  end

  def user_email
    @user.email
  end

  def name
    @user.first_name + " " + @user.middle_name + " " +@user.last_name
  end
  
  def validate_password
    @user.password == password
  end

  private

  attr_accessor :email, :password, :user

  def user
    @user ||= User.find_by_email(email)
    return @user if @user

    errors.add :user_authentication, 'User not found'
    nil
  end
end