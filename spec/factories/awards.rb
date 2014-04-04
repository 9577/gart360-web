# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :award do
    works_name "MyString"
    content "MyString"
    at_time "2013-12-23"
    address "MyString"
    user nil
  end
end
