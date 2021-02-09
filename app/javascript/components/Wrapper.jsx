import React from "react";
import PropTypes from "prop-types";
import HomeGreeting from './HomeGreeting'
import IFramePlayer from './IFramePlayer'
import ArtistDisplay from './ArtistDisplay'

class Wrapper extends React.Component {
  render () {
    
    return (
      <div class="wrapper-component">
        <ArtistDisplay artists={this.props.artists}/><br></br>
        <IFramePlayer spotify_id={this.props.spotify_id}/>
      </div>
    );
  }
}

ArtistDisplay.propTypes = {
  artists: PropTypes.array,
  spotify_id: PropTypes.string
};



export default Wrapper;
