


require 'rubygems'   # Need this to make use of any Gem, in our case it is rufus-scheduler
require 'sms_fu'

require 'rufus/scheduler'  # Need this to make use of Rufus::Scheduler
scheduler = Rufus::Scheduler.start_new
today= Date.today
 twilio_sid = "AC1a126105d88327b67395bc83a291bbd5"
twilio_token = "c542832613c1462a2ea602585f683b68"
twilio_phone_number = "6165555555"
 
twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
scheduler.every '1m' do
   

    


    db =  SQLite3::Database.new "C:/Users/kbui/Documents/GitHub/Calendarapp/db/development.sqlite3"
    #db =  SQLite3::Database.new "C:/Users/cbullock/Documents/Aptana Studio 3 Workspace/Calendar App/db/developement.sqlite3"
    number_to_send_to= db.execute("SELECT phone from users")[0]
    
 
    db.execute("SELECT * from users") do |user| 
      
     
     name= user[2]
     email=user[1]
    
     
     holidays = Array.new 
     db.execute("select * from holidays where holidays.creator ='"+name+"'") do |holiday|
      holidays.push holiday[2]
       
     end
    
      db.execute("select * from events where events.creator ='"+name+"'") do |event|
          #puts "in event"
          
          event_name=event[1]
          event_desc=event[2]
          #24 last event
          event_date=event[3]
          time=event[26] 

         removedate = time.split(' ')
         removetime = removedate[1].split(':')
         event_year= event_date.split('-')
         #event_time=Time.new(event_year[0],event_year[1],event_year[2],removetime[0],remove )
        # event_time=removetime[0]*60*60+removetime[1]*60
       #  puts "event time"+event_time
         
      #   today_time=Time.now.hour*60*60+Time.now.min*60
       # puts "today time"+today_time
         
          
          if event_time   == today_time  
            puts "now"
                        twilio_client.account.sms.messages.create(
              :from => "+1#{5125492953}",
              :to => number_to_send_to,
              :body => "Reminder: The event " + event_name + "is on " + event_date.to_s
              )  
            
          end
          event_time=removetime[0]+':'+removetime[1]
          if Date.parse(event_date) < Date.today or holidays.include? event_date
            puts "skip"
            
          else

           if event[9]
             
             

  
              scheduler.cron '13 0 10 * * 1-5' do
             UserMailer.event(name,email,event_name,event_desc,event_date,event_time).deliver 
              

           end
  
           
          end
          
          if event[10]
            
            scheduler.cron '0 10 * * 6' do
           UserMailer.event(name,email,event_name,event_desc,event_date,event_time).deliver  
        
           end
          end
          if event[11]
            scheduler.cron '0 10 * * 6-7' do
             UserMailer.event(name,email,event_name,event_desc,event_date,event_time).deliver
            
           end
          end
          if event[12]
              scheduler.cron '0 10 * * 1-7' do
             UserMailer.event(name,email,event_name,event_desc,event_date,event_time).deliver
              
           end
          end
          if event[13]
            scheduler.cron '0 10 * * 1-5' do
             UserMailer.event(name,email,event_name,event_desc,event_date,event_time).deliver
             
           end        
          end
          if event[14]
            scheduler.cron '0 10 * * 1' do
             UserMailer.event(name,email,event_name,event_desc,event_date,event_time).deliver 
              
            end        
          end
          if event[15]
            #biweekly
            scheduler.cron '0 10 * * 2,4' do
             UserMailer.event(name,email,event_name,event_desc,event_date,event_time).deliver
              
          end        
          end
          
          if event[16]
            #monthly
            scheduler.cron '0 10 1 * *' do
             UserMailer.event(name,email,event_name,event_desc,event_date,event_time).deliver
              
          end        
          end
          if event[17]
            #yearly
            scheduler.cron '0 10 1 1 * *' do
             UserMailer.event(name,email,event_name,event_desc,event_date,event_time).deliver 
              
          end
          end
          if event[18]
            #semiyearly
            scheduler.cron '0 10 1 1,7 * *' do
             UserMailer.event(name,email,event_name,event_desc,event_date,event_time).deliver 
              
          end       
          end
          if event[19]
            #quarterly
            scheduler.cron '0 10 1 1,4,7,10 * *' do
             UserMailer.event(name,email,event_name,event_desc,event_date,event_time).deliver 
             
          end        
          end
          if event[20]
            scheduler.cron '0 10 * * 1' do
             UserMailer.event(name,email,event_name,event_desc,event_date,event_time).deliver 
             
          end        
          end
          if event[21]
            scheduler.cron '0 10 * * 2' do
             UserMailer.event(name,email,event_name,event_desc,event_date,event_time).deliver 
          
          end        
          end
          if event[22]
            scheduler.cron '0 10 * * 3' do
             UserMailer.event(name,email,event_name,event_desc,event_date,event_time).deliver 
             
          end        
          end
          if event[23]
            scheduler.cron '0 10 * * 4' do
             UserMailer.event(name,email,event_name,event_desc,event_date,event_time).deliver 
             
          end        
          end
          if event[24]
            scheduler.cron '0 10 * * 5' do
             UserMailer.event(name,email,event_name,event_desc,event_date,event_time).deliver 
             
          end   
          end
         
          
         holidays.clear   
        end
          

    end
    
        
 
     
    
      
    end
    puts "done" 
     
end

  # db= SQLite3::Database.new "../../Calendarapp/db/development.sqlite3.db"
 # db.execute 'SELECT * FROM users' do |user|
   # allevent=user.event.all
  #  allevent.each do |current|
    #  if current.daily 
     #   UserMailer.event(user,current).deliver   
  # end
  
  #end