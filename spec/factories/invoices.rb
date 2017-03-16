FactoryGirl.define do
  factory :invoice do
    merchant
    customer
    status "Status"
    created_at "2012-03-17 03:04:05"
  end
end
