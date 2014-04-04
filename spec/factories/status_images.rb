# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :status_image do
    status_id 1
    data "MyString"
    position 1
  end
end
