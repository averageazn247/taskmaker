


require 'rubygems'   # Need this to make use of any Gem, in our case it is rufus-scheduler
 

require 'rufus/scheduler'  # Need this to make use of Rufus::Scheduler
scheduler = Rufus::Scheduler.start_new
 
scheduler.every '1m' do
    puts 'download news feed'


    db =  SQLite3::Database.new "C:/Users/kbui/Documents/GitHub/Calendarapp/db/development.sqlite3"
    db.execute("SELECT * from users") do |user| 
      
     
     name= user[2]
     email=user[1]
     
    
      db.execute("select * from events where events.creator ='"+name+"'") do |event|
        #puts "in event"
        event_name=event[1]
        event_desc=event[2]
        #24 last event
        event_date=event[3]
        event_time=event[26]
        

        if event[9]

          UserMailer.event(name,email,event_name).deliver 
        end
        
        if event[10]
          UserMailer.event(name,email,event_name).deliver 
        end
        if event[11]
          UserMailer.event(name,email,event_name).deliver 
        end
        if event[12]
          
          UserMailer.event(name,email,event_name).deliver 
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