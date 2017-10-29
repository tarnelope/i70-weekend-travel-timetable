class SegmentByTimeSnapshot < ApplicationRecord
  belongs_to :daily_travel_info

  has_many :segment_travel_times
end
