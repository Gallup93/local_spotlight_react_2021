import React from "react";
import PropTypes from "prop-types";

class SelectedArtistDisplay extends React.Component {
  render () {
    return (
      <h1>{this.props.selected_artist.name}</h1>
    )
  }
}

SelectedArtistDisplay.propTypes = {
  selected_artist: PropTypes.object
};

export default SelectedArtistDisplay;
