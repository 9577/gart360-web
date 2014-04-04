# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gallery do
    name "MyString"
    content "MyText"
    user nil
  end
end
