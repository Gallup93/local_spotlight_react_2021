import React from "react";
import PropTypes from "prop-types";

import ReactDOM from 'react-dom'
import axios from 'axios'

class IFramePlayer extends React.Component {
  render () {
    return (
      <div class="home-container">
        <iframe src="https://open.spotify.com/embed/artist/1jAlXWRhCvBrpnX8avLVRP" width="300" height="380" frameborder="0" allowtransparency="true" allow="encrypted-media"></iframe>
      </div>
    );
  }
}


export default IFramePlayer;
