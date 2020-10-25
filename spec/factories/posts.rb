FactoryBot.define do
  factory :post do
    date { Date.today }
    rationale  { "Some content" }
    overtime_request { 2.5 }
    association :user
  end
end