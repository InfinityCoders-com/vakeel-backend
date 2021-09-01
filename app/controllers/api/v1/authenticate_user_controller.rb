class Api::V1::AuthenticateUserController < ApplicationController
  skip_before_action :authenticate_request
 
  def authenticate
    command = AuthenticateUser.call(params[:email])
 
    if command.success?
      render json: { auth_token: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
end