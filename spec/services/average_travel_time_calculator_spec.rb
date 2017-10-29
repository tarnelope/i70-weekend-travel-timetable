require 'spec_helper'

RSpec.describe AverageTravelTimesCalculator do
  subject { described_class.new(2) }

  before do
    100.times do
      create(:segment_travel_time)
    end
  end

  describe "#calculate" do
    it 'returns average times' do
      average_travel_times_by_time_capture = subject.average_travel_times_by_time_capture
      expect(average_travel_times_by_time_capture.class).to eq(Hash)
    end
  end
end
