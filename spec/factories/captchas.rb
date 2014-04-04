# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :captcha do
    mobile "MyString"
    code "MyString"
    status 1
    template nil
  end
end
