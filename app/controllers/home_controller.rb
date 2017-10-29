class HomeController < ApplicationController
  def index
    @segment = SegmentSnapshot.last
    @average_travel_times = average_travel_times
  end

  private

  def average_travel_times
    calculator = AverageTravelTimesCalculator.new(@segment.id)
    calculator.average_travel_times_by_time_capture
  end
end
