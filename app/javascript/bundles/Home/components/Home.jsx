import PropTypes from 'prop-types';
import React from 'react';
import _ from 'lodash';

import segments from '../../../assets/data/segments.json';

import Select from 'react-select';
import { Button } from 'semantic-ui-react';

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
      average_travel_times: this.props.average_travel_times,
      startSegment: null,
      endSegment: null
     };
  }

  sortedSegments() {
    return _.sortBy(segments.segments, 'segment_id');
  }

  setStartSegment = (value) => {
    this.setState({ startSegment: value });
  }

  setEndSegment = (value) => {
    this.setState({ endSegment: value });
  }

  calculateTravelTimes() {
    $.ajax({ url: '/segment_snapshots',
             type: 'POST',
             data: {
               item: {
                 name: name,
                 description: description
               }
             },
             success: (response) => {
               console.log('it worked!', response);
             }
          });

  }

  renderStartSelect() {
    return (
      <div className="segment-select">
        <div className="segment-select-label">
          Select Start Segment
        </div>
        <Select name="endpoint-select"
                value={this.state.startSegment}
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
                value={this.state.endSegment}
                options={this.state.segments}
                onChange={this.setEndSegment} />
      </div>
    )
  }

  renderEndpointSelect() {
    return (
      <div className="endpoint-selects">
        {this.renderStartSelect()}
        {this.renderEndSelect()}
      </div>
    )
  }

  render() {
    return (
      <div>
        { this.renderEndpointSelect() }
        <Button onClick={this.calculateTravelTimes}>
          Calculate Time
        </Button>
      </div>
    );
  }
}
