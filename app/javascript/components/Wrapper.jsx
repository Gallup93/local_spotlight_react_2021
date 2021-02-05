import React from "react";
import PropTypes from "prop-types";
import HomeGreeting from './HomeGreeting'
import IFramePlayer from './IFramePlayer'
import ArtistDisplay from './ArtistDisplay'
import BrowseFilter from './BrowseFilter'

import ReactDOM from 'react-dom'
import axios from 'axios'

class Wrapper extends React.Component {
  render () {
    return (
      <div class="artists-container">
        <ArtistDisplay artists={this.props.artists}/>
        <IFramePlayer />
      </div>
    );
  }
}

ArtistDisplay.propTypes = {
  artists: PropTypes.array
};



export default Wrapper;
