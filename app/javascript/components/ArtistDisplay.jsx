import React from "react";
import PropTypes from "prop-types";

class ArtistDisplay extends React.Component {

  render () {
    function ChangeSelectedArtist() {
      return console.log("Test")
    }

    function artistsList (artists) {
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
                  <div class="artist-container" key={`artist-${artist.id}`} onClick={ChangeSelectedArtist}>
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
        {artistsList(this.props.artists)}
      </div>
    )
  }
};


  ArtistDisplay.propTypes = {
    artists: PropTypes.array
  };


export default ArtistDisplay;
