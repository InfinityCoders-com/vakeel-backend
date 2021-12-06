class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_request, only: %w(create index check_email)

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
    user.council_id.attach(params[:user][:council_id])
    user.profile_pic.attach(params[:user][:profile_pic])
    user.password = params[:user][:password]
    if user.save
      render json: {content: user.user_details, message: 'User created'}, status: 200
    else
      render json: {message: user.errors.messages.join(', '), content: []}, status: 504
    end
  end

  def update
    if current_user.update(user_params)
      render json: {content: current_user.user_details, message: 'User updated'}, status: 200
    else
      render json: {message: current_user.errors.messages.join(', '), content: []}, status: 504
    end
  end

  def upload_pic
    if params[:user][:council_id].present?
      current_user.council_id.attach(params[:user][:council_id])
    end
    if params[:user][:profile_pic].present?
      current_user.profile_pic.attach(params[:user][:profile_pic])
    end
    if current_user.save
      render json: {content: current_user.user_details, message: 'Pic uploaded successfully'}, status: 200
    else
      render json: {message: current_user.errors.messages.join(', '), content: []}, status: 504
    end
  end

  def show
    if current_user.present?
      render json: {content: current_user.user_details, message: 'User Found'}, status: 200
    else
      render json: {message: current_user.errors.messages.join(', '), content: []}, status: 504
    end
  end

  def check_email
    user = User.find_by_email(params[:email])
    if user.present?
      render json: {email_present: true, message: 'Email is taken'}, status: 200
    else
      render json: {message: 'Email is available', email_present: false}, status: 200
    end
  end

  def validate_otp
    if current_user.otp == params[:otp]
      render json: {matched: true, message: 'OTP is valid'}, status: 200
    else
      render json: {message: 'OTP is invalid', matched: false}, status: 200
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :role_name, :security_question, :security_answer, :email, :phone_number, :salutation, :middle_name, :address_line_1, :address_line_2, :city, :state, :country, :pincode, :secondary_phone, :experience, :practicing, :academic_degrees => [])
  end
end
