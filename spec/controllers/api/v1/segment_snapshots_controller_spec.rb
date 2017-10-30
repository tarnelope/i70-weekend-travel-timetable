require 'spec_helper'

RSpec.describe Api::V1::SegmentSnapshotsController, type: :controller do
  let(:start_segment_id) { 32 }
  let(:end_segment_id) { 40 }
  before do
    20.times do |n|
      time = Time.parse('06:00') + (n * 5).minutes
      create(:segment_snapshot,
             segment_id: rand(start_segment_id..end_segment_id),
             created_at: time,
             time_captured: time.strftime('%H:%M'),
             date_captured: time.to_date)
    end
  end

  describe 'GET #index' do
    context 'with valid params' do
      let(:params) do
        {
          start_segment_id: start_segment_id,
          end_segment_id: end_segment_id,
          options: {}
        }
      end

      it 'returns http success' do
        get :index, params: params
        expect(response).to have_http_status(:success)
      end
    end

    # context 'with invalid params' do
    #   it 'returns http success' do
    #     get :index
    #     expect(response).to have_http_status(:missing)
    #   end
    # end
  end
end
