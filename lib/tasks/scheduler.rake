desc "This task is called by the Heroku scheduler add-on"
task :get_or_update_events => :environment do
  puts "Get or Update Events..."
  FB.get_or_update_events()
  puts "Done."
end