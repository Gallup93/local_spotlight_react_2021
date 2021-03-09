import React from "react";
import PropTypes from "prop-types";

import ReactDOM from 'react-dom'
import axios from 'axios'

class IFramePlayer extends React.Component {
  render () {
    var spotifyID = this.props.spotify_id
    var type = this.props.type
    var iframe_link = `https://open.spotify.com/embed/${type}/${spotifyID}`

    if(spotifyID != "no artists") {
      return (
        <div class="iframe-display">
          <iframe src={iframe_link} width="300" height="380" frameborder="0" allowtransparency="true" allow="encrypted-media"></iframe>
        </div>
      );
    } else {
      return (
        <div class="iframe-display">
          <h2>Currently no artists for this location</h2>
        </div>
      );
    }
  }
}

IFramePlayer.propTypes = {
  spotify_id: PropTypes.string,
  type: PropTypes.string
};

export default IFramePlayer;
