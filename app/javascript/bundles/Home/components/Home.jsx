import PropTypes from 'prop-types';
import React from 'react';
import _ from 'lodash';
import $ from 'jquery';

import segments from '../../../assets/data/segments.json';

import Select from 'react-select';
import { Button, Table, Form, Radio } from 'semantic-ui-react';

export default class Home extends React.Component {
  static propTypes = {
  };

  /**
   * @param props - Comes from your rails view.
   */
  constructor(props) {
    super(props);

    this.state = {
      averageTravelTimes: this.props.averageTravelTimes,
      startSegmentId: null,
      endSegmentId: null,
      averageTravelTimesTable: null,
      westbound: true
     };
  }

  sortedSegments() {
    const displayedSegments = _.sortBy(segments.segments, 'value');

    if (!this.state || this.state.westbound ) {
      return _.filter(displayedSegments, (segment) => { return segment.westbound });
    } else {
      return _.filter(displayedSegments, (segment) => { return !segment.westbound });
    }
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

  setTravelDirection = (e, { value }) => {
    this.setState({ westbound: value });
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
                options={this.sortedSegments()}
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
                options={this.sortedSegments()}
                onChange={this.setEndSegment} />
      </div>
    )
  }

  renderEndpointsSelect() {
    return (
      <div className="endpoints-select">
        {this.renderStartSelect()}
        {this.renderEndSelect()}
      </div>
    )
  }

  renderTravelDirectionRadio() {
    return (
      <Form className="travel-direction-radio">
        <Form.Field>
          Selected value:
        </Form.Field>
        <Form.Field>
          <Radio
            label='Westbound'
            name='radioGroup'
            value={true}
            checked={this.state.westbound}
            onChange={this.setTravelDirection}
          />
        </Form.Field>
        <Form.Field>
          <Radio
            label='Eastbound'
            name='radioGroup'
            value={false}
            checked={!this.state.westbound}
            onChange={this.setTravelDirection}
          />
        </Form.Field>
      </Form>
    )
  }

  renderTravelTimeTable() {
    if (!this.state.averageTravelTimesTable) {
      return null;
    } else {
      const headerRow = [
        'Departure',
        'Arrival',
        'Travel Time (minutes)'
      ];

      const renderBodyRow = ({ departure, arrival, travel_time }, i) => ({
        key: departure || `row-${i}`,
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
        { this.renderTravelDirectionRadio() }
        { this.renderEndpointsSelect() }
        <Button className="calculate-button"
                onClick={this.calculateTravelTimes}>
          Calculate Time
        </Button>
        { this.renderTravelTimeTable() }
      </div>
    );
  }
}
