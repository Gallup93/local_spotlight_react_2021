import React from "react";
import PropTypes from "prop-types";

class ArtistContainer extends React.Component {
  constructor(props){
    super(props);
    this.state = { artist: this.props.artist};
  }

  render(){
    return(
      <div class="artist-container" key={`artist-${this.state.artist.id}`}>
        <td>{this.state.artist.name} --- [Followers: {this.state.artist.followers}, Popularity Rating: {this.state.artist.popularity}]</td>
      </div>
    )
  }
}

export default ArtistContainer
