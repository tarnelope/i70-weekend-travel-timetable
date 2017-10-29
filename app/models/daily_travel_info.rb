class DailyTravelInfo < ApplicationRecord
  has_many :segment_by_time_snapshots
end
