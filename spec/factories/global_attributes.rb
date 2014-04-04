# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :global_attribute do
    global_attribute_catalog_id 1
    value "MyString"
  end
end
