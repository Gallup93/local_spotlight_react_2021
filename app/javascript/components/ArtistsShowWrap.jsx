import React from "react";
import PropTypes from "prop-types";
import ArtistsShowName from './ArtistsShowName';
import ArtistImage from './ArtistImage';
import ArtistInfo from './ArtistInfo';
import IFramePlayer from './IFramePlayer';
import DiscogContainer from './DiscogContainer';


class ArtistsShowWrap extends React.Component {
  constructor(props) {
    super(props);
    this.handler = this.handler.bind(this);
    this.state = { artist: this.props.artist, albums: this.props.albums, selected_album: this.props.albums[0]};
  }
  handler(selected_album) {
     this.setState({
       selected_album: selected_album
     });
  }
  render() {
    return(
      <div class="show-wrap">
        <ArtistsShowName name={this.state.artist.name}/>
        <ArtistImage urls={this.state.artist.images}/>
        <ArtistInfo artist={this.state.artist} />
        <IFramePlayer type="album" spotify_id={this.state.selected_album.spotify_id}/>
        <DiscogContainer albums={this.state.albums} action={this.handler}/>
      </div>
    )
  }
}

export default ArtistsShowWrap;
