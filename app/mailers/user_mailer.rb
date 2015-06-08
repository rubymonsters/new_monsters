class UserMailer < ApplicationMailer
  default from: 'rubymonstas@gmail.com'

  def notification_email(user)
    @user = user
    mail(to: @user.email, subject: 'You are invited to join our new beginners group')
  end
end
