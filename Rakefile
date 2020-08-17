require_relative './config/environment.rb'
require 'sinatra/activerecord/rake'

desc "Opens up the console environment"
task :console do
  require 'irb'
  ARGV.clear
  IRB.start
end

namespace :db do

  desc "Destroys all instances of event"
  task :destroy_events do
    Event.destroy_all
    puts "Removed all events"
  end

  desc "Shows list of all events"
  task :show_events do
    puts <<~EVENTLIST
    ===========
    Event List:
    ===========
    EVENTLIST

    puts Event.all.map(&:title)

    puts "\nTotal: #{Event.all.length}"
  end

end

desc "Make run file executable, sets up databases"
task :install do
  puts "Getting most recent version"
  system("git pull")
  puts "Making run file executable..."
  system("chmod +x bin/run")
  puts "Creating and migrating database..."
  system("rake db:create")
  system("rake db:migrate")
  puts "Seeding database..."
  system("rake db:seed")
  puts ("Installation Complete")
end

desc "Gets the most recent version from github"
task :update do
  puts "Getting most recent version"
  system("git pull")
  puts "Making run file executable..."
  system("chmod +x bin/run")
  puts "Checking for pre-existing data..."
  unless system("ls db/development.sqlite3")
    puts "Creating and migrating database..."
    system("rake db:create")
    system("rake db:migrate")
    puts "Seeding database..."
    system("rake db:seed")
  end
  puts ("Update Complete")
end

desc "Runs the program"
task :run do
  system("bin/run")
end
