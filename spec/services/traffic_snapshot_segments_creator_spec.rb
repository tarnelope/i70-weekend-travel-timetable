RSpec.describe TrafficSnapshotSegmentsCreator do
  let(:traffic_data) do
    {
      "TileId": "3157382",
      "Header": {
        "GeneratedDate": "2017-01-01T00:00:00.000-07:00",
        "Domain": "cotrip.org,www.cotrip.org,beta.cotrip.org,www.beta.cotrip.org,m.cotrip.org,cell.cotrip.org,go.cotrip.org,data.cotrip.org,i.cotrip.org,legacy.cotrip.org,www.legacy.cotrip.org",
        "EntityId": "1"
      },
      "Segment": [
        {
          "IsSlowDown": "false",
          "RoadId": "31",
          "AverageTrafficFlow": "-1.0",
          "CalculatedDate": "2017-01-03T23:48:30.000-07:00",
          "AverageOccupancy": "-1",
          "SpeedLimit": "75",
          "TypeTrafficFlowCd": "5",
          "TravelTime": {
            "Minutes": "3"
          },
          "SegmentType": "Highway",
          "Direction": "North",
          "ExpectedTravelTime": {
            "Minutes": "3"
          },
          "AverageSpeed": "69",
          "SegmentId": "336",
          "EndMileMarker": "131.65",
          "Status": "enabled",
          "TypeTrafficFlowTxt": "No Data",
          "AverageVolume": "-1",
          "TravelTimeInSeconds": "197",
          "Length": "3.79",
          "StartMileMarker": "127.86",
          "RoadName": "I-70",
          "SegmentName": "025N128 - Santa Fe Ave to Mesa Ridge Pkwy"
        },
        {
          "IsSlowDown": "false",
          "RoadId": "31",
          "AverageTrafficFlow": "-1.0",
          "CalculatedDate": "2017-01-03T23:48:30.000-07:00",
          "AverageOccupancy": "-1",
          "SpeedLimit": "75",
          "TypeTrafficFlowCd": "5",
          "SegmentType": "Highway",
          "Direction": "North",
          "ExpectedTravelTime": {
            "Minutes": "3"
          },
          "AverageSpeed": "-1",
          "SegmentId": "337",
          "EndMileMarker": "135.26",
          "Status": "enabled",
          "TypeTrafficFlowTxt": "No Data",
          "AverageVolume": "-1",
          "TravelTimeInSeconds": "-1",
          "Length": "3.61",
          "StartMileMarker": "131.65",
          "RoadName": "I-70",
          "SegmentName": "025N132 - Mesa Ridge Pkwy to S. Academy Blvd"
        }
      ]
    }.with_indifferent_access
  end

  subject { described_class.new(traffic_data) }

  let(:file_double) { double('file_double') }

  describe "#create" do
    it 'should create file' do
      # expect(File).to receive(:open).with("data/traffic/Jan/01/00:00.json", "w")
      # subject.create
      expect { subject.create }.to change{ SegmentSnapshot.count }.by(2)
    end
  end
end
