class User < ActiveRecord::Base
  # attr_accessible :title, :body
  def self.do_something
    puts "something"
  end
end
