class SegmentSnapshotsController < ApplicationController

  def index
    render json: response_json
  end

  private

  def response_json
    {
      segments: Array(SegmentSnapshot.last)
    }
  end

  def average_travel_times(segment)
    AverageTravelTimesCalculator.new(segment)
  end
end
