import React from "react";
import PropTypes from "prop-types";
import ArtistsShowName from './ArtistsShowName';
import ArtistImage from './ArtistImage';
import ArtistInfo from './ArtistInfo';
import IFramePlayer from './IFramePlayer';


class ArtistsShowWrap extends React.Component {
  constructor(props) {
    super(props);
    this.state = { artist: this.props.artist, albums: this.props.albums, selected_album: this.props.albums[0]};
  }
  render() {
    return(
      <div class="show-wrap">
        <ArtistImage urls={this.state.artist.images}/>
        <ArtistsShowName name={this.state.artist.name}/>
        <ArtistInfo artist={this.state.artist} />
        <IFramePlayer type="album" spotify_id={this.state.selected_album.spotify_id}/>
      </div>
    )
  }
}

export default ArtistsShowWrap;
