class UserNotifierMailer < ApplicationMailer
  default :from => 'address@example.com'

  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Thanks for signing up with Chirper!' )
  end

end
