# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
 
#userall= User.all

 #userall.each do |user |
   #allevent= user.event.all
   #allevent.each do |current|
   # if current.daily
   #   UserMailer.event( user, current)
    
   # end
    #if current.weekly
     
   #  end
   
  #  if current.monthly
     
 #    end
     
     
     
     
     
  # end
 #end
  # db= SQLite3::Database.new "../../Calendarapp/db/development.sqlite3.db"
 # db.execute 'SELECT * FROM users' do |user|
   # allevent=user.event.all
  #  allevent.each do |current|
    #  if current.daily 
     #   UserMailer.event(user,current).deliver   
  # end
  
  #end
set :output, "#{path}/log/cron.log"
every 2.minutes do
  runner "puts 'hello'"
  
  

end

