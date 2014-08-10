# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :friend do
    name "MyString"
    screen_name "MyString"
    location "MyString"
    latitude 1.5
    longitude 1.5
    user_id 1
  end
end
