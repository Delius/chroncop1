# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :usertip, :class => 'Usertips' do
    tip nil
    user nil
  end
end
