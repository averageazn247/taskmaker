class AddNamesToEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    t.string   :name
    t.text     :description
    t.date     :dayof
    t.string   :reminder
    t.string   :emails
    t.string   :creator
    t.boolean  :sunday
    t.boolean  :satday
    t.boolean  :weekends
    t.boolean  :daily
    t.boolean  :weekdays
    t.boolean  :weekly
    t.boolean  :biweekly
    t.boolean  :monthly
    t.boolean  :yearly
    t.boolean  :semiyearly
    t.boolean  :quarterly
    t.boolean  :monday
    t.boolean  :tuesday
    t.boolean  :wedsday
    t.boolean  :thursday
    t.boolean  :friday
    t.boolean  :long
  end
end
end

