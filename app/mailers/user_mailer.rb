class UserMailer < ApplicationMailer

  def send_otp
    @user = params[:user]
    otp = rand.to_s[2...6]
    mail(to: @user.email, subject: 'Login OTP')
  end
end