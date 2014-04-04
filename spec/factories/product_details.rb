# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product_detail do
    product_id 1
    body "MyText"
  end
end
