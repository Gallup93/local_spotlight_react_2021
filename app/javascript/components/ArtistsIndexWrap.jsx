import React from "react";
import PropTypes from "prop-types";
import IFramePlayer from './IFramePlayer'
import ArtistDisplay from './ArtistDisplay'

class ArtistsIndexWrap extends React.Component {

  constructor(props) {
    super(props);

  }

  render () {
    return (
      <div class="wrapper-component">
        <ArtistDisplay artists={this.props.artists}/><br></br>
        <IFramePlayer spotify_id={this.props.selected_artist.spotify_id}/>
      </div>
    );
  }
}

ArtistDisplay.propTypes = {
  artists: PropTypes.array,
  selected_artist: PropTypes.object
};



export default ArtistsIndexWrap;
