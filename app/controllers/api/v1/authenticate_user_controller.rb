class Api::V1::AuthenticateUserController < ApplicationController
  skip_before_action :authenticate_request
 
  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])
    is_valid_password = command.validate_password if command.success?
    if is_valid_password
      # Send OTP on email
      render json: { auth_token: command.result, email: command.user_email, name: command.name }
    else
      render json: { error: command.errors.present? ? command.errors : "Please check the credentials" }, status: :unauthorized
    end
  end
end