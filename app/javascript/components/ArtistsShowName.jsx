import React from "react";
import PropTypes from "prop-types";


class ArtistsShowName extends React.Component {
  render() {
    return(
      <div class="show-name">
        <h1>{this.props.name}</h1>
      </div>
    )
  }
}

export default ArtistsShowName;
