# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :shout do
    body "MyString"
    user nil
  end
end
