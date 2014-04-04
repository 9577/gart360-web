# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :global_image do
    user_id 1
    data "MyString"
  end
end
