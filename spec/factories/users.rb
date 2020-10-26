FactoryBot.define do
  factory :user do
    first_name { 'John' }
    last_name  { 'Doe' }
    email { Faker::Internet.unique.email }
    password { 'password' }
    phone { '07777777777' }
  end

  factory :second_user, class: 'User' do
    first_name { 'Second' }
    last_name  { 'User' }
    email { Faker::Internet.unique.email }
    password { 'password' }
    phone { '06666666666' }
  end

  factory :admin_user, class: 'AdminUser' do
    first_name { 'Admin' }
    last_name  { 'User' }
    email { 'admin@email.com' }
    password { 'password' }
    phone { '05555555555' }
  end
end