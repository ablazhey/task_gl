# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reservation do
    table 1
    start "2014-01-01 10:00:00"
    finish "2014-01-01 20:00:00"
  end
  
end
