class UserNotifierMailer < ApplicationMailer
  default :from => 'address@example.com'

  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Thanks for signing up with Chirper!' )
  end

  def user_being_followed_email(user, current_user)
    @user = user
    @current_user = current_user
    mail( :to => @user.email,
    :subject => 'You are being followed on Chirper!' )
  end

end
