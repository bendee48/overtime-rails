# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
employee1 = Employee.create!(first_name: 'Bob',
                     last_name: 'Holness',
                     email: 'test@email.com',
                     password: 'password',
                     phone: '05555555555',
                     ssn: 1234,
                     company: "The Company")

employee2 = Employee.create!(first_name: 'Emma',
                     last_name: 'Quill',
                     email: 'emma@email.com',
                     password: 'password',
                     phone: '07777777777',
                     ssn: 1234,
                     company: "The Company")

puts '2 Employees created.'

AdminUser.create!(first_name: 'Admin',
                  last_name: 'User',
                  email: 'admin@email.com',
                  password: 'password',
                  phone: '09999999999',
                  ssn: 1234,
                  company: "The Company")
                  
puts '1 Admin User created'

text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

20.times do |num|
  Post.create!(date: Date.today, work_performed: "#{num}: #{text}", user_id: employee1.id, daily_hours: 8.5)
  Post.create!(date: Date.today, work_performed: "#{num}: #{text}", user_id: employee2.id, daily_hours: 7.5)
  #AuditLog.create!(user_id: user2.id)
end

5.times do |num|
  Post.create!(date: Date.today, work_performed: "#{num}: #{text}", user_id: employee2.id, daily_hours: 10.5, status: "approved")
  Post.create!(date: Date.today, work_performed: "#{num}: #{text}", user_id: employee2.id, daily_hours: 9.5, status: "rejected")
end

AuditLog.create!(user_id: employee2.id)
AuditLog.create!(user_id: employee2.id, start_date: Date.today - 13.days)
AuditLog.create!(user_id: employee2.id, start_date: Date.today - 20.days)

puts '16 posts created.'
puts '3 audit logs created.'
