# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create!(first_name: 'Bob', last_name: 'Holness', email: 'test@email.com', password: 'password')
user2 = User.create!(first_name: 'Emma', last_name: 'Quill', email: 'emma@email.com', password: 'password')
puts '2 Users created.'

AdminUser.create(first_name: 'Admin', last_name: 'User', email: 'admin@email.com', password: 'password')
puts '1 Admin User created'

10.times do |num|
  Post.create!(date: Date.today, rationale: "#{num} rationale content", user_id: user1.id)
  Post.create!(date: Date.today, rationale: "#{num} rationale content", user_id: user2.id)
end

puts '20 posts created.'