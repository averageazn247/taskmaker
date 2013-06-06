class UserMailer < ActionMailer::Base
  default :from => "averageazn1337@gmail.com"
  
  def event(user,email,event,desc, date,time) 
    #name,email,event_name,event_desc,event_date,event_time)
    @user = user
    @event = event
    @email =email
    @date = date
    timesplit = time.split(' ')
    @time = timesplit[1]
    @desc = desc

    mail(:to => "#{user } <#{email}>", :subject => event+" Reminder")
  end
  
 
end
