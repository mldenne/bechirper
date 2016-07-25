class UserNotifierMailer < ApplicationMailer

  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Thanks for signing up with Chirper!' )
  end

end
