import React from "react";
import PropTypes from "prop-types";
import IFramePlayer from './IFramePlayer'
import ArtistDisplay from './ArtistDisplay'

class ArtistsIndexWrap extends React.Component {

  constructor(props) {
    super(props);
    this.state = { selected_spot_id: this.props.selected_spot_id };
  }

  render () {
    return (
      <div class="wrapper-component">
        <ArtistDisplay artists={this.props.artists}/><br></br>
        <IFramePlayer spotify_id={this.state.selected_spot_id}/>
      </div>
    );
  }
}

ArtistDisplay.propTypes = {
  artists: PropTypes.array,
  selected_spot_id: PropTypes.string
};



export default ArtistsIndexWrap;
