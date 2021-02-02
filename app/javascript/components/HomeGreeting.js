import React from "react";
import PropTypes from "prop-types";

class HomeGreeting extends React.Component {
  render () {
    return (
      <div>
        <h4>Hello {this.props.name}, </h4>
        <h2>Weclome to Local Spotlight!</h2>
      </div>
    );
  }
}

HomeGreeting.propTypes = {
  name: PropTypes.string
};

export default HomeGreeting;
