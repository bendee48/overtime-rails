namespace :notification do
  desc "Sends SMS notification to employees asking them to log any overtime"
  task sms: :environment do
    puts "I'm in a Rake task #{Post.count}"
  end
end
