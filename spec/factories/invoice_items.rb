FactoryGirl.define do
  factory :invoice_item do
    invoice
    item
    quantity 1
    unit_price 12345
    created_at "2012-03-17 03:04:05"
    updated_at "2012-03-18 04:04:25"
  end
end
