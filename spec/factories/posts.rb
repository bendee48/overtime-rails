FactoryBot.define do
  factory :post do
    date { Date.today }
    work_performed  { "Some content" }
    daily_hours { 10.5 }
    association :user
  end
end