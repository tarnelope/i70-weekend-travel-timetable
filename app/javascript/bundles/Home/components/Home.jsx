import PropTypes from 'prop-types';
import React from 'react';
import _ from 'lodash';

import segments from '../../../assets/data/segments.json';

import Select from 'react-select';

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

  renderStartSelect() {
    return (
      <div class="segment-select">
        <div class="segment-select-label">
          Select Start Segment
        </div>
        <Select
          name="endpoint-select"
          value={this.state.startSegment}
          options={this.state.segments}
          onChange={this.setStartSegment}
        />
      </div>
    )
  }

  renderEndSelect() {
    return (
      <div class="segment-select">
        <div class="segment-select-label">
          Select End Segment
        </div>
        <Select
          name="endpoint-select"
          value={this.state.endSegment}
          options={this.state.segments}
          onChange={this.setEndSegment}
        />
      </div>
    )
  }

  renderEndpointSelect() {
    return (
      <div class="endpoint-selects">
        {this.renderStartSelect()}
        {this.renderEndSelect()}
      </div>
    )
  }

  render() {
    return (
      <div>
        { this.renderEndpointSelect() }
      </div>
    );
  }
}
