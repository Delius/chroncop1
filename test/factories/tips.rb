# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tip do
    title "MyString"
    difficulty_level "MyString"
    condition_name_id 1
    symptom_name_id 1
    tip_type_id 1
    what_needed "MyText"
    my_tip "MyText"
  end
end
