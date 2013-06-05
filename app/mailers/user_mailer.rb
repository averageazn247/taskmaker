class UserMailer < ActionMailer::Base
  default :from => "averageazn1337@gmail.com"
  
  def event(user,email,event,desc, date,time)
    @user = user
    @event = event
    @email =email
    @date = date
    @time = time
    @desc = desc

    mail(:to => "#{user } <#{email}>", :subject => event+" Reminder")
  end
  
 
end
