import React from "react";
import PropTypes from "prop-types";

class ArtistDisplay extends React.Component {
  render () {
    function artistsList (artists, action) {
      return (
        <div class="artist-display-component">
          <h1>---ARTISTS-DISPLAY-TABLE---</h1>
          <table>
            <thead>
              <tr>
                <th colspan="3"></th>
              </tr>
            </thead>
            <tbody>
              {
                artists.map((artist) => (
                  <div class="artist-container" key={`artist-${artist.id}`} onClick={() => action(artist.spotify_id)}>
                    <td>{artist.name} | CITY: {artist.city}, STATE: {artist.state}, FOLLOWERS: {artist.followers}</td>
                  </div>
                ))
              }
            </tbody>
          </table>
        </div>
      )
    }
    return (
      <div class="artists-container">
        {artistsList(this.props.artists, this.props.action)}
      </div>
    )
  }
};

ArtistDisplay.propTypes = {
  artists: PropTypes.array,
  action: PropTypes.func
};

export default ArtistDisplay;
