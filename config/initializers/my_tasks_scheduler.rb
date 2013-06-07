


require 'rubygems'   # Need this to make use of any Gem, in our case it is rufus-scheduler
 

require 'rufus/scheduler'  # Need this to make use of Rufus::Scheduler
scheduler = Rufus::Scheduler.start_new
today= Date.today
scheduler.every '15m' do
   

    


    db =  SQLite3::Database.new "C:/Users/kbui/Documents/GitHub/Calendarapp/db/development.sqlite3"
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
          event_time=event[26] 
           
           

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