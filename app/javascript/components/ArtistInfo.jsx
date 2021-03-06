import React from "react";
import PropTypes from "prop-types";


class ArtistInfo extends React.Component {
  constructor(props){
    super(props)
    var genres = this.props.artist.genres
    this.state = { artist: this.props.artist, genres: genres.slice(0,3) };
  }
  render() {
    return(
      <div class="artist-info">
        <ul>
          <li>Followers: {this.state.artist.followers}</li>
          <li>Popularity: {this.state.artist.popularity}</li>
          <li>Top Genres:
            <ul>
              <li>{this.state.genres[0]}</li>
              <li>{this.state.genres[1]}</li>
              <li>{this.state.genres[2]}</li>
            </ul>
          </li>
          <li>Date added: {this.state.artist.created_at.toString().slice(0,10)}</li>
        </ul>
      </div>
    )
  }
}



export default ArtistInfo;
