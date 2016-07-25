class UserBeingFollowedMailer < ApplicationMailer
  default :from => 'address@example.com'

  def UserBeingFollowedMailer(user)
    current_user = user
    mail( :to => current_user.email,
    :subject => 'You are being followed on Chirper!' )
  end

end
