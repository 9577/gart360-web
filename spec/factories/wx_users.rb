# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :wx_user do
    openid "MyString"
    phone "MyString"
    name "MyString"
  end
end
