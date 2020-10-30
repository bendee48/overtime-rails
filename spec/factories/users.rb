FactoryBot.define do
  factory :user do
    first_name { 'John' }
    last_name  { 'Doe' }
    email { Faker::Internet.unique.email }
    password { 'password' }
    phone { '07777777777' }
  end

  factory :employee, class: 'Employee' do
    first_name { 'Michael' }
    last_name  { 'Rosen' }
    email { 'mike@email.com' }
    password { 'password' }
    phone { '02222222222' }
  end

  factory :employee_2, class: 'Employee' do
    first_name { 'Second' }
    last_name  { 'Employee' }
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