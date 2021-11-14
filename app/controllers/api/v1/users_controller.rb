class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_request, only: %w(create)

  def index
    user = User.advocates.paginate(page: params[:page], per_page: params[:per_page])
    if user.present?
      render json: {content: user, meta: {total_entries: user.total_entries}}, status: 200
    else
      render json: {content: [], message: 'No user Found'}, status: 204
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: {content: user, message: 'User created'}, status: 200
    else
      render json: {message: user.errors.messages.join(', '), content: []}, status: 504
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number)
  end
end