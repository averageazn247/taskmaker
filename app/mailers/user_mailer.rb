class UserMailer < ActionMailer::Base
  default :from => "averageazn1337@gmail.com"
  
  def event(user,email,event)
    @user = user
    @event = event
    @email =email

    mail(:to => "#{user } <#{email}>", :subject => event+" Reminder")
  end
  
 
end
