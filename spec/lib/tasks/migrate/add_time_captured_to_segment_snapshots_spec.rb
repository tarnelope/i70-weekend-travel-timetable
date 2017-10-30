require 'spec_helper'

describe 'migrate:add_time_captured_to_segment_snapshots', type: :task do
  let :run_rake_task do
    Rake::Task['migrate:add_time_captured_to_segment_snapshots']
  end

  describe 'create:segments_by_time_snapshots' do
    before do
      20.times do |n|
        create(:segment_snapshot, created_at: Time.now + (n * 5).minutes, time_captured: nil, date_captured: nil)
      end

      task.execute
    end

    describe 'time_captured' do
      it 'are all filled' do
        times_captured_length = SegmentSnapshot.all.map(&:time_captured).compact.length
        expect(times_captured_length).to eq(SegmentSnapshot.count)
      end

      it 'are all String object' do
        times_captured = SegmentSnapshot.all.map(&:time_captured)
        expect(times_captured).to all(be_an(String))
      end

      it 'are roundest to closest 5 minute' do
        times_captured = SegmentSnapshot.all.map(&:time_captured)
        times_captured_minutes = times_captured.map(&:last)
        expect(times_captured_minutes - ["5", "0"]).to be_empty
      end
    end

    describe 'date_captured' do
      it 'are all filled' do
        date_captured_length = SegmentSnapshot.all.map(&:date_captured).compact.length
        expect(date_captured_length).to eq(SegmentSnapshot.count)
      end

      it 'are all Date object' do
        dates_captured = SegmentSnapshot.all.map(&:date_captured)
        expect(dates_captured).to all(be_an(Date))
      end
    end
  end
end
