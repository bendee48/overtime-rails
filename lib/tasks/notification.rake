namespace :notification do
  desc "Sends SMS notification to employees asking them to log any overtime"
  task sms: :environment do
    puts "I'm in a Rake task #{Post.count}"
  end

  desc "Sends email to manager (admin user) about pending overtime requests"
  task manager_email: :environment do
    admin_users = AdminUser.all

    unless Post.submitted.empty?
      admin_users.each do |admin_user|
        ManagerMailer.email(admin_user).deliver_later
      end
      puts "Manager emails sent."
    end
  end
end
