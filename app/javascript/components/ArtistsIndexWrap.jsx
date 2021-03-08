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
    function titleCase(str) {
      str = str.toLowerCase().split(' ');
      for (var i = 0; i < str.length; i++) {
        str[i] = str[i].charAt(0).toUpperCase() + str[i].slice(1);
      }
      return str.join(' ');
    }
    return (
      <div class="index-page-wrapper">
      <br></br>
        <h1 class="current-city-state">{titleCase(this.state.selected_artist.city)}, {this.state.selected_artist.state}</h1>
        <ArtistDisplay artists={this.props.artists}  action={this.handler}/><br></br>
        <SelectedArtistDisplay selected_artist={this.state.selected_artist}/>
        <IFramePlayer type="artist" spotify_id={this.state.selected_artist.spotify_id}/>
      </div>
    );
  }
}

export default ArtistsIndexWrap;
