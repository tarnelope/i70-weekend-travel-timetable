require 'rails_helper'
RSpec.describe SnapshotCollectionWorker, type: :worker do
  it 'creates new job' do
    expect(CreateTrafficSnapshotJob).to receive(:perform_now)

    SnapshotCollectionWorker.new.perform
  end
end
