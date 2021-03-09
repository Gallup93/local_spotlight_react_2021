import React from "react";
import PropTypes from "prop-types";

class HomeGreeting extends React.Component {
  render () {
    return (
      <div class="home-component">
        <h4>Hello {this.props.name}, </h4>
        <h2>Weclome to Local Spotlight!</h2>
        <p>
          A user-driven database of local Spotify artists. The goal is to make it easier<br></br>
          to discover and share the music that is made by the people in your community.<br></br>
          <br></br> For more information visit the <a href="https://github.com/Gallup93/local_spotlight_react_2021">GitHub repository</a><br></br>
          or email me directly at: Gallup815@gmail.com
        </p>
        <h3>Visit Login page to test a Chicago based user or browse a city yourself:</h3>
        <ul>
          <li><a href="/artists?select_location=2">Boston, MA</a></li>
          <li><a href="/artists?select_location=3">Chicago, IL</a></li>
          <li><a href="/artists?select_location=4">Denver, CO</a></li>
        </ul>
      </div>
    );
  }
}

HomeGreeting.propTypes = {
  name: PropTypes.string
};

export default HomeGreeting;
