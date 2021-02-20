import React from "react";
import PropTypes from "prop-types";
import IFramePlayer from './IFramePlayer'
import ArtistDisplay from './ArtistDisplay'
import SelectedArtistDisplay from './SelectedArtistDisplay'

class ArtistsIndexWrap extends React.Component {
  constructor(props) {
    super(props);
    this.handler = this.handler.bind(this);
    this.state = { selected_artist: this.props.selected_artist};
  }
  handler(artist) {
     this.setState({
       selected_artist: artist
     });
  }
  render () {
    return (
      <div class="wrapper-component">
        <SelectedArtistDisplay selected_artist={this.state.selected_artist}/>
        <ArtistDisplay artists={this.props.artists}  action={this.handler}/><br></br>
        <IFramePlayer spotify_id={this.state.selected_artist.spotify_id}/>
      </div>
    );
  }
}

export default ArtistsIndexWrap;
