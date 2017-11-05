FactoryGirl.define do
  factory :segment_snapshot do
    travel_time { rand(1.0..12.9) }
    expected_travel_time { rand(1.0..12.9) }
    segment_id { rand(1..10) }
  end

  factory :segment_by_time_snapshot do
    association :daily_travel_info
    time_captured { FactoryHelpers.random_time_captured }
  end

  factory :daily_travel_info do
  end
end
