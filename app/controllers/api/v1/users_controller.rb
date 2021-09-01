class Api::V1::UsersController < ApplicationController

  def index
    user = User.advocates.paginate(page: params[:page], per_page: params[:per_page])
    if user.present?
      render json: {content: user, meta: {total_entries: user.total_entries}}, 200
    else
      render json: {}, 204
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: {content: user, message: 'User created'}, 200
    else
      render json: {message: user.errors.messages.join(', '), content: []}, 500
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number)
  end
end