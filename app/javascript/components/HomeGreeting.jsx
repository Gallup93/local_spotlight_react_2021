import React from "react";
import PropTypes from "prop-types";

class HomeGreeting extends React.Component {
  render () {
    return (
      <div class="home-component">
        <h4>Hello {this.props.name}, </h4>
        <h2>Weclome to Local Spotlight!</h2>
        <p>A user-driven database of local Spotify artists</p>
      </div>
    );
  }
}

HomeGreeting.propTypes = {
  name: PropTypes.string
};

export default HomeGreeting;
