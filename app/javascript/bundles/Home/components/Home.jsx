import PropTypes from 'prop-types';
import React from 'react';

export default class Home extends React.Component {
  static propTypes = {
    name: PropTypes.string
  };

  /**
   * @param props - Comes from your rails view.
   */
  constructor(props) {
    super(props);

    this.state = { segment: this.props.segment, average_travel_times: this.props.average_travel_times };
  }

  render() {
    return (
      <div>
        <p>Will this work?</p>
      </div>
    );
  }
}
