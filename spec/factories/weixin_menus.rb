# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :weixin_menu do
    menu_type "MyString"
    name "MyString"
    key "MyString"
    url "MyString"
    sequence 1
  end
end
