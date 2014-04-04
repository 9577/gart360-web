# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :weixin_sub_menu do
    weixin_menu_id 1
    menu_type "MyString"
    name "MyString"
    key "MyString"
    url "MyString"
    sequence 1
  end
end
