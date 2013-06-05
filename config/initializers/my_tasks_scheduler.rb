


require 'rubygems'   # Need this to make use of any Gem, in our case it is rufus-scheduler
 

require 'rufus/scheduler'  # Need this to make use of Rufus::Scheduler
scheduler = Rufus::Scheduler.start_new
 
scheduler.every '1m' do
    puts 'download news feed'
    puts Date.today
    


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
          scheduler.cron '13 0 10 * * 1-5' do
           UserMailer.event(name,email,event_name,event_desc,event_date,event_time).deliver 
           end
        end
        
        if event[10]
         UserMailer.event(name,email,event_name,event_desc,event_date,event_time).deliver  
        end
        if event[11]
           UserMailer.event(name,email,event_name,event_desc,event_date,event_time).deliver 
        end
        if event[12]
          
           UserMailer.event(name,email,event_name,event_desc,event_date,event_time).deliver 
        end
        if event[13]
          
           UserMailer.event(name,email,event_name,event_desc,event_date,event_time).deliver 
        end        
        if event[14]
          
           UserMailer.event(name,email,event_name,event_desc,event_date,event_time).deliver 
        end        
        if event[15]
          
           UserMailer.event(name,email,event_name,event_desc,event_date,event_time).deliver 
        end        
        if event[16]
          
           UserMailer.event(name,email,event_name,event_desc,event_date,event_time).deliver 
        end        
        if event[17]
          
           UserMailer.event(name,email,event_name,event_desc,event_date,event_time).deliver 
        end
        if event[18]
          
           UserMailer.event(name,email,event_name,event_desc,event_date,event_time).deliver 
        end       
        if event[19]
          
           UserMailer.event(name,email,event_name,event_desc,event_date,event_time).deliver 
        end        
        if event[20]
          
           UserMailer.event(name,email,event_name,event_desc,event_date,event_time).deliver 
        end        
        if event[21]
          
           UserMailer.event(name,email,event_name,event_desc,event_date,event_time).deliver 
        end        
        if event[22]
          
           UserMailer.event(name,email,event_name,event_desc,event_date,event_time).deliver 
        end        
        if event[23]
          
           UserMailer.event(name,email,event_name,event_desc,event_date,event_time).deliver 
        end        
        if event[24]
          
           UserMailer.event(name,email,event_name,event_desc,event_date,event_time).deliver 
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