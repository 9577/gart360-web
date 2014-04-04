# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :artist do
    avatar "MyString"
    name "MyString"
    content "MyText"
    user nil
  end
end
