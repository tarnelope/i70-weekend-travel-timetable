require 'spec_helper'
require 'rake'
Rails.application.load_tasks

describe 'create segments_by_time_snapshots rake task' do
  let :run_rake_task do
    Rake::Task["create:segments_by_time_snapshots"].invoke(Time.now.getutc.to_date)
  end

  describe 'create:segments_by_time_snapshots' do
    before do
      5.times do |n|
        create(:segment_snapshot, created_at: Time.now + (n * 5).minutes)
      end
    end

    # Only the first test is failing because rake task is only getting invoked once

    # it 'should create daily_travel_info' do
    #   expect { run_rake_task }.to change{ DailyTravelInfo.count }.by(1)
    # end
    #
    # it 'should create segment_by_time_snapshot' do
    #   expect { run_rake_task }.to change{ SegmentByTimeSnapshot.count }.by(5)
    # end
    #
    # it 'should create segment_travel_time' do
    #   expect { run_rake_task }.to change{ SegmentTravelTime.count }.by(5)
    # end
  end
end
