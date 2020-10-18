FactoryBot.define do
  factory :post do
    date { Date.today }
    rationale  { "Some content" }
    association :user
  end
end