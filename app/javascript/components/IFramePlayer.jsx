import React from "react";
import PropTypes from "prop-types";

import ReactDOM from 'react-dom'
import axios from 'axios'

class IFramePlayer extends React.Component {
  render () {
    var spotifyID = `https://open.spotify.com/embed/artist/${ this.props.spotify_id }`


    return (
      <div class="home-container">
        <iframe src={spotifyID} width="300" height="380" frameborder="0" allowtransparency="true" allow="encrypted-media"></iframe>
      </div>
    );
  }
}



IFramePlayer.propTypes = {
  spotify_id: PropTypes.string
};

export default IFramePlayer;
