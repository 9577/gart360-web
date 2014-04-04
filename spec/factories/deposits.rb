# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :deposit do
    auction_product_id 1
    user_id 1
  end
end
