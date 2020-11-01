include Rails.application.routes.url_helpers

namespace :notification do
  desc "Sends SMS notification to employees asking them to log hours"
  task sms: :environment do
    if Date.today.sunday?
      employees = Employee.all
      message = "Please log onto the daily hours management app to confirm your hours for last week: #{"https://overtime-app-123.herokuapp.com"}"
      
      employees.each do |employee|
        AuditLog.create!(user_id: employee.id)
        #SmsTool.send_sms(message: message, number: employee.phone)
      end
      puts "SMS sent."
    end
  end

  desc "Sends email to manager (admin user) about daily hours"
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
