module Api::V1
  class SegmentSnapshotsController < ApplicationController
    def index
      render json: response_json
    end

    private

    def response_json
      {
        average_travel_times_table: average_travel_times_table.segment_avg_travel_time_table
      }
    end

    def average_travel_times_table
      @_average_travel_times_table = AverageTravelTimesTable.new(params[:start_segment_id], params[:end_segment_id])
    end
  end
end
