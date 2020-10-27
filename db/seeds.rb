# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create!(first_name: 'Bob',
                     last_name: 'Holness',
                     email: 'test@email.com',
                     password: 'password',
                     phone: '05555555555')

user2 = User.create!(first_name: 'Emma',
                     last_name: 'Quill',
                     email: 'emma@email.com',
                     password: 'password',
                     phone: '07777777777')

puts '2 Users created.'

AdminUser.create!(first_name: 'Admin',
                  last_name: 'User',
                  email: 'admin@email.com',
                  password: 'password',
                  phone: '09999999999')
                  
puts '1 Admin User created'

20.times do |num|
  Post.create!(date: Date.today, rationale: "#{num} rationale content", user_id: user1.id, overtime_request: 2.5)
  Post.create!(date: Date.today, rationale: "#{num} rationale content", user_id: user2.id, overtime_request: 0.5)
  AuditLog.create!(user_id: user2.id)
end

5.times do |num|
  Post.create!(date: Date.today, rationale: "#{num} rationale content", user_id: user2.id, overtime_request: 2.5, status: "approved")
  Post.create!(date: Date.today, rationale: "#{num} rationale content", user_id: user2.id, overtime_request: 2.5, status: "rejected")
end

puts '16 posts created.'
puts '5 audit logs created.'
