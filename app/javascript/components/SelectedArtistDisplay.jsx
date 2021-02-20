import React from "react";
import PropTypes from "prop-types";

class SelectedArtistDisplay extends React.Component {
  render () {
    return (
      <div class="selected-artist">
        <h1>{this.props.selected_artist.name}</h1>
      </div>
    )
  }
}

SelectedArtistDisplay.propTypes = {
  selected_artist: PropTypes.object
};

export default SelectedArtistDisplay;
