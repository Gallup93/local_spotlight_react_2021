import React from "react";
import PropTypes from "prop-types";

class HomeGreeting extends React.Component {
  render () {
    return (
      <div class="home-container">
        <h4>Hello {this.props.name}, </h4>
        <h2>Weclome to Local Spotlight!</h2>
        <p>this is a public service announcement; this is only a test</p>
      </div>
    );
  }
}

HomeGreeting.propTypes = {
  name: PropTypes.string
};

export default HomeGreeting;
