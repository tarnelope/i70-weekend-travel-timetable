require 'rake'

RSpec.describe 'collect traffic_snapshot rake task' do
  before do
    Rake.application.rake_require('lib/tasks/collect/traffic_snapshot')
  end

  it 'why this not work?' do
    binding.pry
    true
  end

  describe 'collect:traffic_snapshot' do
    include_context "rake"
    #
    # let(:run_rake_task) do
    #   Rake::Task["collect:traffic_snapshot"].reenable
    #   Rake.application.invoke_task "collect:traffic_snapshot"
    # end

    it 'enqueues job' do
      binding.pry
      expect { subject.invoke }.to change { CreateTrafficSnapshotJob.size }.by(1)
    end
  end
end
