FactoryBot.define do
  factory :user do
    first_name { 'John' }
    last_name  { 'Doe' }
    email { Faker::Internet.unique.email }
    password { 'password' }
  end

  factory :admin_user, class: 'AdminUser' do
    first_name { 'Admin' }
    last_name  { 'User' }
    email { 'admin@email.com' }
    password { 'password' }
  end
end