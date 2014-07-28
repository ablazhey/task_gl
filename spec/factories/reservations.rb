# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reservation do
    table 1
    start "2014-07-28 18:29:20"
    finish "2014-07-28 20:29:20"
  end
  
  # factory :reservation_not_valid_1 do
  #   table 1
  #   start "2014-07-28 18:29:20"
  #   finish "2014-07-28 17:29:20"
  # end

  # factory :reservation_not_valid_2 do
  #   table 1
  #   start "2014-07-28 18:29:20"
  #   finish "2014-07-29 19:29:20"
  # end

  # factory :reservation_not_valid_3 do
  #   table 1
  #   start "2014-07-28 18:29:20"
  #   finish "2014-07-29 19:29:20"
  # end
end
