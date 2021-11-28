class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_request, only: %w(create index)

  def index
    users = User.advocates.paginate(page: params[:page], per_page: params[:per_page])
    if users.present?
      user_details = users.map{|user| user.user_details}
      render json: {content: user_details, meta: {total_entries: users.total_entries}}, status: 200
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
    params.require(:user).permit(:first_name, :last_name, :role_name, :security_question, :security_answer, :email, :phone_number, :salutation, :middle_name, :address_line_1, :address_line_2, :city, :state, :country, :pincode, :secondary_phone, :experience, :practicing, :academic_degrees => [])
  end
end