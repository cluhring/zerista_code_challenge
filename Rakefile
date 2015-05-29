# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

task upload: :environment do
  csv_text = File.read('test_events.csv')
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    Session.create!(row.to_hash.slice("start", "finish", "name"))
    # Track.create!(row.to_hash.slice("track_name"))
  end
end
