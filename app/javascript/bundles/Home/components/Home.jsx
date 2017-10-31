import PropTypes from 'prop-types';
import React from 'react';
import _ from 'lodash';

import segments from '../../../assets/data/segments.json';

import Select from 'react-select';
import { Button, Table } from 'semantic-ui-react';

export default class Home extends React.Component {
  static propTypes = {
  };

  /**
   * @param props - Comes from your rails view.
   */
  constructor(props) {
    super(props);

    this.state = {
      segments: this.sortedSegments(),
      averageTravelTimes: this.props.averageTravelTimes,
      startSegmentId: null,
      endSegmentId: null,
      averageTravelTimesTable: null
     };
  }

  sortedSegments() {
    return _.sortBy(segments.segments, 'value');
  }

  setStartSegment = (segment) => {
    this.setState({ startSegmentId: segment.value });
  }

  setEndSegment = (segment) => {
    this.setState({ endSegmentId: segment.value });
  }

  setAverageTravelTimesTable = (averageTravelTimesTable) => {
    this.setState({ averageTravelTimesTable });
  }

  calculateTravelTimes = () => {
    const url = `v1/segment_snapshots?start_segment_id=${this.state.startSegmentId}&end_segment_id=${this.state.endSegmentId}`
    $.ajax({ url: url,
             type: 'GET',
             data: {
               start_segment_id: this.state.startSegmentId,
               end_segment_id: this.state.endSegmentId,
             },
             success: (response) => {
               this.setAverageTravelTimesTable(response.average_travel_times_table);
             }
          });
  }

  getTableArray() {
    return _.map(_.toPairs(this.state.averageTravelTimesTable), d => _.fromPairs([d]));
  }

  renderStartSelect() {
    return (
      <div className="segment-select">
        <div className="segment-select-label">
          Select Start Segment
        </div>
        <Select name="endpoint-select"
                value={this.state.startSegmentId}
                options={this.state.segments}
                onChange={this.setStartSegment} />
      </div>
    )
  }

  renderEndSelect() {
    return (
      <div className="segment-select">
        <div className="segment-select-label">
          Select End Segment
        </div>
        <Select name="endpoint-select"
                value={this.state.endSegmentId}
                options={this.state.segments}
                onChange={this.setEndSegment} />
      </div>
    )
  }

  renderEndpointsSelect() {
    return (
      <div className="endpoint-selects">
        {this.renderStartSelect()}
        {this.renderEndSelect()}
      </div>
    )
  }

  renderTravelTimeTable() {
    if (!this.state.averageTravelTimesTable) {
      return null;
    } else {
      const headerRow = [
        'Departure',
        'Arrival',
        'Travel Time'
      ];

      const renderBodyRow = ({ departure, arrival, travel_time }, i) => ({
        key: `row-${i}`,
        cells: [
          departure,
          arrival,
          travel_time
        ],
      })

      return (
        <Table
          celled
          headerRow={headerRow}
          renderBodyRow={renderBodyRow}
          tableData={this.state.averageTravelTimesTable}
        />
      )
    }
  }

  render() {
    return (
      <div>
        { this.renderEndpointsSelect() }
        <Button onClick={this.calculateTravelTimes}>
          Calculate Time
        </Button>
        { this.renderTravelTimeTable() }
      </div>
    );
  }
}
