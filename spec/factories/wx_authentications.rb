# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :wx_authentication do
    openid "MyString"
    access_token "MyString"
    refresh_token "MyString"
    scope "MyString"
  end
end
