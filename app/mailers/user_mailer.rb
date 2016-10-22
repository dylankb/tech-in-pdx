class UserMailer < ActionMailer::Base
  default :from => ENV['ADMIN_EMAIL']

  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.email}", :subject => "Registration Confirmation")
  end
end
