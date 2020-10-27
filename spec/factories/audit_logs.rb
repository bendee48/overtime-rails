FactoryBot.define do
  factory :audit_log do
    user { nil }
    status { 1 }
    start_date { "2020-10-27" }
    end_date { "2020-10-27" }
  end
end
